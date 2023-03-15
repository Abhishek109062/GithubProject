class ReposModel {
  final String name;
  final String fullname;
  // final String description;

  const ReposModel({
    required this.name,
    required this.fullname,
    // required this.description,
  });

  factory ReposModel.fromJson(Map<dynamic, dynamic> json) {
    return ReposModel(
      name: json['name'],
      fullname: json['full_name'],
      // description: json['description'],
    );
  }
}