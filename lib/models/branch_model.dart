import 'package:tlcn_project/utils/store_util.dart';

class Branch {
  final String id;
  final String name;
  final String image;
  final String description;
  final DateTime opened;

  Branch({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.opened,
  });

  factory Branch.fromUtil(StoreUtil util) {
    return Branch(
      id: util.id,
      name: util.name,
      image: util.mainImage,
      description: util.fullAddress,
      opened: util.updatedAt,
    );
  }
}
