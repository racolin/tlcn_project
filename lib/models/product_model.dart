class Product {
  final String id;
  final String image;
  final String name;
  final double price;
  final int perWeek;
  final String category;
  final DateTime dateTime;
  final bool hide;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.perWeek,
    required this.category,
    required this.dateTime,
    required this.hide,
  });
}
