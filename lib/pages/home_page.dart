import 'package:atmos_app/models/weather_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Future<WeatherItem> dadosDaApi;
  final VoidCallback onRefresh;

  const HomePage({
    super.key,
    required this.dadosDaApi,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherItem>(
      future: dadosDaApi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('Nenhum dado disponível'));
        }

        WeatherItem data = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            leading: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Icon(Icons.home),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 24),
                child: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    onRefresh();
                  },
                ),
              ),
            ],
          ),
          body: Center(
            child: FractionallySizedBox(
              widthFactor: 0.94,
              child: Column(
                spacing: 32,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 72.0,
                    ),
                    decoration: BoxDecoration(
                      border: BoxBorder.fromLTRB(
                        bottom: BorderSide(width: 3.0, color: Colors.blue),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("Air Quality", style: TextStyle(fontSize: 32)),
                        Text(
                          "${data.pointCount}",
                          style: TextStyle(fontSize: 80),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 8,
                          children: [
                            Icon(Icons.sunny, size: 56, color: Colors.orange),
                            Text("Ozone", style: TextStyle(fontSize: 20)),
                            Text(
                              "${data.averages.O3_Avg_ug_m3}",
                              style: TextStyle(fontSize: 32),
                            ),
                            Text("µg/m³"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 8,
                          children: [
                            Icon(
                              Icons.masks_outlined,
                              size: 56,
                              color: Colors.yellow,
                            ),
                            Text("NO²", style: TextStyle(fontSize: 20)),
                            Text(
                              "${data.averages.NO2_Avg_ug_m3}",
                              style: TextStyle(fontSize: 32),
                            ),
                            Text("µg/m³"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 8,
                          children: [
                            Icon(Icons.masks, size: 56, color: Colors.cyan),
                            Text("SO².", style: TextStyle(fontSize: 20)),
                            Text(
                              "${data.averages.SO2_Avg_ug_m3}",
                              style: TextStyle(fontSize: 32),
                            ),
                            Text("µg/m³"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.orange, width: 2.0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        Icon(
                          Icons.sentiment_neutral_sharp,
                          size: 48,
                          color: Colors.orange,
                        ),
                        Expanded(
                          child: Text(
                            data.overallQuality,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
