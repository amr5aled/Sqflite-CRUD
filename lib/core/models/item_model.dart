const String tableItems = 'notes';

class ItemsFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, createdAt, time, image, status
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String createdAt = 'createdAt';
  static const String time = 'time';
  static const String image = 'image';
  static const String status = 'status';
}

class Items {
  int? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? time;
  String? image;
  String? status;

  Items(
      {this.id,
      this.title,
      this.description,
      this.createdAt,
      this.time,
      this.image,
      this.status});
  // ignore: unnecessary_new
  factory Items.fromMap(Map<String, dynamic> json) => new Items(
        id: json[ItemsFields.id],
        title: json[ItemsFields.title],
        description: json[ItemsFields.description],
        createdAt: DateTime.parse(json[ItemsFields.createdAt] as String),
        time: DateTime.parse(json[ItemsFields.time] as String),
        image: json[ItemsFields.image],
        status: json[ItemsFields.status],
      );

  Map<String, dynamic> toMap() => {
        ItemsFields.id: id,
        ItemsFields.title: title,
        ItemsFields.description: description,
        ItemsFields.createdAt: createdAt!.toIso8601String(),
        ItemsFields.time: time!.toIso8601String(),
        ItemsFields.image: image,
        ItemsFields.status: status,
      };
}
