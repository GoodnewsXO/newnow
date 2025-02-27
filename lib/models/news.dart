class News {
  final String id;
  final String title;
  final String content;
  final String authorId;
  final String categoryId;
  final String bannerImageUrl;
  final int views;
  final int likes;
  final int comments;
  final DateTime createdAt;
  final DateTime updatedAt;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    required this.categoryId,
    required this.bannerImageUrl,
    required this.views,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a News object from JSON
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      authorId: json['author_id'],
      categoryId: json['category_id'],
      bannerImageUrl: json['banner_image_url'],
      views: json['views'] ?? 0, // Default to 0 if null
      likes: json['likes'] ?? 0, // Default to 0 if null
      comments: json['comments'] ?? 0, // Default to 0 if null
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Convert a News object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author_id': authorId,
      'category_id': categoryId,
      'banner_image_url': bannerImageUrl,
      'views': views,
      'likes': likes,
      'comments': comments,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
