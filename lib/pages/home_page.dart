import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Future<Map<String, dynamic>> dadosDaApi;

  const HomePage({super.key, required this.dadosDaApi});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: dadosDaApi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Nenhum dado disponível'));
        }

        final data = snapshot.data!;

        // Use os dados da API conforme necessário
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
                child: IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
              ),
            ],
          ),
          body: Center(
            child: FractionallySizedBox(
              widthFactor: 0.94,
              child: Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.green),
                ),
                child: Column(
                  spacing: 16,
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
                          Text("8", style: TextStyle(fontSize: 120)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(width: 2.0, color: Colors.red),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: BoxBorder.all(
                                  width: 2.0,
                                  color: Colors.purple,
                                ),
                              ),
                              child: Column(
                                spacing: 8,
                                children: [
                                  Icon(Icons.sunny, size: 56),
                                  Text(
                                    "UV Index",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text("4.3", style: TextStyle(fontSize: 40)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: BoxBorder.all(
                                  width: 2.0,
                                  color: Colors.purple,
                                ),
                              ),
                              child: Column(
                                spacing: 8,
                                children: [
                                  Icon(Icons.masks_outlined, size: 56),
                                  Text("CO2", style: TextStyle(fontSize: 20)),
                                  Text("4.3", style: TextStyle(fontSize: 40)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: BoxBorder.all(
                                  width: 2.0,
                                  color: Colors.purple,
                                ),
                              ),
                              child: Column(
                                spacing: 8,
                                children: [
                                  Icon(Icons.thermostat, size: 56),
                                  Text("Temp.", style: TextStyle(fontSize: 20)),
                                  Text("4.3", style: TextStyle(fontSize: 40)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.purple, width: 2.0),
                      ),
                      child: Row(
                        spacing: 16,
                        children: [
                          Icon(Icons.sentiment_neutral_sharp, size: 48),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  "Moderate air quality",
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  "Avoid long exposure to outside air and polluted places",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
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
