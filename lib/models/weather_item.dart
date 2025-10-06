class WeatherItem {
  String startTime;
  double lat;
  double lon;
  Averages averages;
  int pointCount;
  String overallQuality;
  String alertMessage;

  WeatherItem({
    required this.startTime,
    required this.lat,
    required this.lon,
    required this.averages,
    required this.pointCount,
    required this.overallQuality,
    required this.alertMessage,
  });

  static WeatherItem fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      // CORRIGIDO: de 'start_time' para 'startTime'
      startTime: json['startTime'] ?? '',
      lat: json['lat'] ?? 0,
      lon: json['lon'] ?? 0,
      // O objeto 'averages' e suas chaves já estavam corretos
      averages: Averages(
        NO2_Avg_Index: (json['averages']['NO2_Avg_Index'] ?? 0).toDouble(),
        NO2_Avg_ug_m3: (json['averages']['NO2_Avg_ug_m3'] ?? 0).toDouble(),
        O3_Avg_Index: (json['averages']['O3_Avg_Index'] ?? 0).toDouble(),
        O3_Avg_ug_m3: (json['averages']['O3_Avg_ug_m3'] ?? 0).toDouble(),
        SO2_Avg_Index: (json['averages']['SO2_Avg_Index'] ?? 0).toDouble(),
        SO2_Avg_ug_m3: (json['averages']['SO2_Avg_ug_m3'] ?? 0).toDouble(),
      ),
      // CORRIGIDO: de 'point_count' para 'pointCount'
      pointCount: json['pointCount'] ?? 0,
      // CORRIGIDO: de 'overall_quality' para 'overallQuality'
      overallQuality: json['overallQuality'] ?? '',
      // CORRIGIDO: de 'alert_message' para 'alertMessage'
      alertMessage: json['alertMessage'] ?? '',
    );
  }
}

class Averages {
  double NO2_Avg_Index;
  double NO2_Avg_ug_m3;
  double O3_Avg_Index;
  double O3_Avg_ug_m3;
  double SO2_Avg_Index;
  double SO2_Avg_ug_m3;

  Averages({
    required this.NO2_Avg_Index,
    required this.NO2_Avg_ug_m3,
    required this.O3_Avg_Index,
    required this.O3_Avg_ug_m3,
    required this.SO2_Avg_Index,
    required this.SO2_Avg_ug_m3,
  });
}
