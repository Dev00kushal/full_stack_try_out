class Joke {
  final int id;
  final String title;
  final String description;

  Joke({required this.id, required this.title, required this.description});

  factory Joke.fromJson(Map<dynamic, dynamic> json) {
    return Joke(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
