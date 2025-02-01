import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<dynamic> countries = [];
  List<dynamic> filteredCountries = [];
  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    const url = 'https://restcountries.com/v3.1/all';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            countries = json.decode(response.body);
            filteredCountries = List.from(countries);
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() => isLoading = false);
        }
        if (kDebugMode) {
          print('Failed to load countries');
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
      }
      if (kDebugMode) {
        print('Error fetching countries: $e');
      }
    }
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries.where((country) {
        final name = country['name']['common'].toString().toLowerCase();
        final capital = country['capital']?[0]?.toString().toLowerCase() ?? '';
        final region = country['region'].toString().toLowerCase();
        return name.contains(query.toLowerCase()) ||
            capital.contains(query.toLowerCase()) ||
            region.contains(query.toLowerCase());
      }).toList();
    });
  }

  Widget _buildCountryCard(dynamic country) {
    final population = (country['population'] as int).toStringAsFixed(0);
    final formattedPopulation = population.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _showCountryDetails(country),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flag and Basic Info Section
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(country['flags']['png']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          country['name']['common'],
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        country['flag'],
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(Icons.location_city, 'Capital',
                      '${country['capital']?[0] ?? 'N/A'}'),
                  _buildInfoRow(
                      Icons.public, 'Region', '${country['region'] ?? 'N/A'}'),
                  _buildInfoRow(Icons.people, 'Population',
                      '$formattedPopulation people'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  void _showCountryDetails(dynamic country) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: controller,
            children: [
              // Flag
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(country['flags']['png']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Country Name and Official Name
              Text(
                country['name']['common'],
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                country['name']['official'],
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const Divider(height: 32),

              // Detailed Information
              _buildDetailSection('General Information', [
                _buildDetailRow(
                    'Capital', '${country['capital']?[0] ?? 'N/A'}'),
                _buildDetailRow('Region', country['region']),
                _buildDetailRow('Subregion', country['subregion'] ?? 'N/A'),
                _buildDetailRow('Population',
                    '${country['population'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'),
              ]),

              _buildDetailSection('Additional Information', [
                _buildDetailRow('Area', '${country['area'].toString()} km²'),
                _buildDetailRow('Languages',
                    '${(country['languages'] as Map?)?.values.join(", ") ?? "N/A"}'),
                _buildDetailRow('Currencies',
                    '${(country['currencies'] as Map?)?.values.map((curr) => curr['name']).join(", ") ?? "N/A"}'),
                _buildDetailRow('Time Zones',
                    '${(country['timezones'] as List).join(", ")}'),
              ]),

              if (country['maps']?['googleMaps'] != null)
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement map opening functionality
                  },
                  icon: const Icon(Icons.map),
                  label: const Text('View on Map'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'World Explorer',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: filterCountries,
              decoration: InputDecoration(
                hintText: 'Search countries...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) =>
                        _buildCountryCard(filteredCountries[index]),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
