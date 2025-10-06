import 'package:atmos_app/models/weather_item.dart';
import 'package:atmos_app/presentation/widgets/area_chart.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final Future<WeatherItem> dadosDaApi;

  const DashboardPage({super.key, required this.dadosDaApi});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            title: Text("Dashboard"),
            leading: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Icon(Icons.dashboard),
            ),
          ),
          body: Center(
            child: FractionallySizedBox(
              widthFactor: 0.94,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(width: 3, color: Colors.green),
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ozone Index",
                                style: TextStyle(fontSize: 22),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Actual Value:",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "${data.averages.O3_Avg_ug_m3}",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          LineChartSample2(),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(width: 3, color: Colors.green),
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SO² Index",
                                style: TextStyle(fontSize: 22),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Actual Value:",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "${data.averages.SO2_Avg_ug_m3}",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          LineChartSample2(),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(width: 3, color: Colors.green),
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "NO² Index",
                                style: TextStyle(fontSize: 22),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Actual Value:",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "${data.averages.NO2_Avg_ug_m3}",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          LineChartSample2(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
