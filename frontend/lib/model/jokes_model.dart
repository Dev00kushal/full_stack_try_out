class Joke {
  final int id;
  final String title;
  final String description;

  Joke({required this.id, required this.title, required this.description});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
