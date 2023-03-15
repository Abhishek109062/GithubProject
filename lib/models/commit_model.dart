class Commit {
  final String message;
  final String authorName;

  Commit({
    required this.message,
    required this.authorName,
  });

  factory Commit.fromJson(Map<dynamic, dynamic> json) {
    return Commit(
      message: json['message'] as String,
      authorName: json['author']['name'] as String,
    );
  }
}