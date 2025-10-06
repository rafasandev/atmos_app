class WeatherItem {
  final String iconName;
  final String indexName;
  final String indexValue;
  final String status;

  WeatherItem({
    this.iconName = "mark_outline",
    this.indexName = "Qualidade do ar",
    this.indexValue = "12",
    this.status = "Qualidade do ar abaixo do ideal",
  });
}

const String loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

List<WeatherItem> getNewIndexData() {
  return [
    WeatherItem(iconName: 'sentiment_happy', indexName: 'Air Quality'),
    WeatherItem(iconName: 'sentiment_happy', indexName: 'Air Quality'),
    WeatherItem(iconName: 'sentiment_happy', indexName: 'Air Quality'),
    WeatherItem(iconName: 'sentiment_happy', indexName: 'Air Quality'),
    WeatherItem(iconName: 'sentiment_happy', indexName: 'Air Quality'),
  ];
}
