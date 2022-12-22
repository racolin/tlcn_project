class EmployeeUtil {
  final String id;
  final String image;
  final String name;
  final String username;
  final String email;
  final String role;
  final DateTime joinDate;
  final bool hide;

  EmployeeUtil({
    required this.id,
    required this.image,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.joinDate,
    required this.hide,
  });

  factory EmployeeUtil.fromJson(Map<String, dynamic> json) {
    return EmployeeUtil(
      id: json['_id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      joinDate: json['joinDate'] == null ? DateTime.now() : DateTime.parse(json['joinDate']),
      hide: false,
    );
  }
}
