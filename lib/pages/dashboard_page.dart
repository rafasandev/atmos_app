import 'package:atmos_app/presentation/widgets/area_chart.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: List.generate(7, (index) {
                return Container(
                  decoration: BoxDecoration(
                    border: BoxBorder.all(width: 3, color: Colors.green),
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
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
                            "Index ${index + 1}",
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
                          Text("Actual Value:", style: TextStyle(fontSize: 18)),
                          Text(
                            "14.2",
                            style: TextStyle(fontSize: 32, color: Colors.green),
                          ),
                        ],
                      ),
                      LineChartSample2(),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
