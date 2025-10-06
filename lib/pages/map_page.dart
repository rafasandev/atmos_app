import 'package:atmos_app/models/weather_item.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  final Future<WeatherItem> dadosDaApi;

  const MapPage({super.key, required this.dadosDaApi});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dadosDaApi,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return Scaffold(
          body: Center(child: Text("Map Page - Data: ${data.toString()}")),
        );
      },
    );
  }
}
