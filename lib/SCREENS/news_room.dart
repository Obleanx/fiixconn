import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> generalArticles = [];
  List<dynamic> sportsArticles = [];
  bool isLoading = true;
  TabController? _tabController; // Make nullable

  @override
  void initState() {
    super.initState();
    // Initialize TabController here
    _tabController = TabController(length: 2, vsync: this);
    fetchNews();
    fetchSportsNews();
  }

  Future<void> fetchNews() async {
    const apiKey = '3fb55d6d5683439f959651e69426d1e0';
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (mounted) {
          // Check if widget is still mounted
          setState(() {
            generalArticles = data['articles'];
            isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        // Check if widget is still mounted
        setState(() => isLoading = false);
      }
      if (kDebugMode) print('Error: $e');
    }
  }

  Future<void> fetchSportsNews() async {
    const apiKey = '3fb55d6d5683439f959651e69426d1e0';
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (mounted) {
          // Check if widget is still mounted
          setState(() {
            sportsArticles = data['articles'];
          });
        }
      }
    } catch (e) {
      if (kDebugMode) print('Error: $e');
    }
  }

  Widget _buildArticleCard(dynamic article) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article['urlToImage'] != null)
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                article['urlToImage'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 200, child: Center(child: Icon(Icons.error))),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article['title'] ?? '',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  article['description'] ?? 'No description available',
                  style:
                      GoogleFonts.roboto(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(article['publishedAt']),
                      style: GoogleFonts.roboto(
                          fontSize: 12, color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Implement article detail view
                      },
                      child: const Text('Read More'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '';
    final date = DateTime.tryParse(dateStr);
    if (date == null) return '';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    // Check if _tabController is initialized
    if (_tabController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'News Hub',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: 'Headlines'),
            Tab(text: 'Sports'),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                RefreshIndicator(
                  onRefresh: fetchNews,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: generalArticles.length,
                    itemBuilder: (context, index) =>
                        _buildArticleCard(generalArticles[index]),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: fetchSportsNews,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: sportsArticles.length,
                    itemBuilder: (context, index) =>
                        _buildArticleCard(sportsArticles[index]),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose(); // Safely dispose of the controller
    super.dispose();
  }
}
