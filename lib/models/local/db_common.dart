final String tableCoutry = 'country';

class CommonDbFields {
  static final List<String> values = [
    /// Add all fields
    id, idcrm, name, code, status
  ];

  static final String id = '_id';
  static final String idcrm = 'idcrm';
  static final String name = 'name';
  static final String code = 'code';
  static final String status = 'status';
}

class Coutry {
  final int? id;
  final String idcrm;
  final String name;
  final String code;
  final String status;

  const Coutry({
    this.id,
    required this.idcrm,
    required this.name,
    required this.code,
    required this.status,
  });

  Coutry copy({
    int? id,
    String? idcrm,
    String? name,
    String? code,
    String? status,
  }) =>
      Coutry(
        id: id ?? this.id,
        idcrm: idcrm ?? this.idcrm,
        name: name ?? this.name,
        code: code ?? this.code,
        status: status ?? this.status,
      );
  static Coutry fromJson(Map<String, Object?> json) => Coutry(
    id: json[CommonDbFields.id] as int?,
    idcrm: json[CommonDbFields.idcrm] as String,
    name: json[CommonDbFields.name] as String,
    code: json[CommonDbFields.code] as String,
    status: json[CommonDbFields.status] as String,
  );

  Map<String, Object?> toJson() => {
    CommonDbFields.id: id,
    CommonDbFields.idcrm: idcrm,
    CommonDbFields.name: name,
    CommonDbFields.code: code,
    CommonDbFields.status: status,
  };
}
