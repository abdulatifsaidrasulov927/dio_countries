import 'package:dio_countries/data/model/country.dart';
import 'package:dio_countries/servis/api_servic.dart';
import 'package:dio_countries/ui/widgets/country_detail.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  CountryData? countryData;

  bool isLoading = false;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    countryData = await ApiService.getCountry();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: const Text(
          "Country",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    ...List.generate(countryData!.data.countries.length,
                        (index) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryDetail(
                                        country: countryData!
                                            .data.countries[index])));
                          },
                          title: Text(
                            countryData!.data.countries[index].name,
                            style: TextStyle(fontSize: 24),
                          ),
                          leading: Text(
                            countryData!.data.countries[index].emoji,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                    })
                  ],
                ))
              ],
            ),
    );
  }
}
