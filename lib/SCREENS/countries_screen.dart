import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<dynamic> countries = [];
  bool isLoading = true;

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
        setState(() {
          countries = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        if (kDebugMode) {
          print('Failed to load countries');
        }
      }
    } catch (e) {
      setState(() => isLoading = false);
      if (kDebugMode) {
        print('Error fetching countries: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries Information')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  title: Text(country['name']['common']),
                  subtitle: Text('Capital: ${country['capital']?[0] ?? 'N/A'}'),
                  trailing: Text(country['flag']),
                );
              },
            ),
    );
  }
}
