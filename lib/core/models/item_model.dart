const String tableItems = 'notes';

class ItemsFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, createdAt, image, status
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String createdAt = 'createdAt';
  static const String image = 'image';
  static const String status = 'status';
}

class Items {
  int? id;
  String? title;
  String? description;
  String? createdAt;

  String? image;
  String? status;

  Items(
      {this.id,
      this.title,
      this.description,
      this.createdAt,
      this.image,
      this.status});
  // ignore: unnecessary_new
  factory Items.fromMap(Map<String, dynamic> json) => new Items(
        id: json[ItemsFields.id],
        title: json[ItemsFields.title],
        description: json[ItemsFields.description],
        createdAt: json[ItemsFields.createdAt],
        image: json[ItemsFields.image],
        status: json[ItemsFields.status],
      );

  Map<String, dynamic> toMap() => {
        ItemsFields.id: id,
        ItemsFields.title: title,
        ItemsFields.description: description,
        ItemsFields.createdAt: createdAt!,
        ItemsFields.image: image,
        ItemsFields.status: status,
      };
}
