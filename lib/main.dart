import 'package:atmos_app/pages/main_page.dart';
import 'package:atmos_app/presentation/data/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      home: const MainPage(),
    );
  }
}

List<WeatherItem> getNewIndexData() {
  return [
    WeatherItem(
      iconName: 'sentiment_happy',
      indexName: 'Qualidade do Ar',
      indexValue: '25',
      status: 'Boa',
    ),
    WeatherItem(
      iconName: 'air',
      indexName: 'Vento',
      indexValue: '12 km/h',
      status: 'Moderado',
    ),
    WeatherItem(
      iconName: 'water_drop',
      indexName: 'Umidade',
      indexValue: '65%',
      status: 'Ideal',
    ),
    // ... outros itens
  ];
}

Future<void> updateWidgetData() async {
  // 1. Pega sua lista de dados fixos.
  final List<WeatherItem> data = getNewIndexData();

  // 2. Como o XML tem só um campo, pegamos o primeiro item da lista.
  if (data.isNotEmpty) {
    final firstItem = data.first;

    // 3. Formata os dados do primeiro item em uma única String.
    final String formattedText =
        '${firstItem.indexName}: ${firstItem.indexValue} - ${firstItem.status}';

    // 4. Salva a string formatada com a chave que o Kotlin espera.
    await HomeWidget.saveWidgetData<String>('widget_text', formattedText);

    // 5. Dispara a atualização do widget na tela inicial.
    await HomeWidget.updateWidget(
      name: 'WeatherWidget',
      androidName: 'WeatherWidget',
    );
  }
}
