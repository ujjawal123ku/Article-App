class Blog {
  final int id;
  final String title;
  final String publication_date;
  final String desc;
  final String full_article;

  Blog({
    required this.id,
    required this.title,
    required this.publication_date,
    required this.desc,
    required this.full_article,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as int? ?? 0, // Default to 0 if 'id' is null
      title: json['title'] as String? ?? '', // Default to an empty string if 'title' is null
      publication_date: json['publication_date'] as String? ?? '', // Default to an empty string if 'date' is null
      desc: json['desc'] as String? ?? '', // Default to an empty string if 'desc' is null
      full_article: json['full_article'] as String? ?? '', // Default to an empty string if 'full_article' is null
    );
  }
}
