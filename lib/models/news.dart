class News {
  final String? id;
  final String? title;
  final String? content;
  final String? authorId;
  final String? categoryId;
  final String? bannerImageUrl;
  final int? views;
  final int? likes;
  final int? comments;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? categoryName;

  News({
    this.id,
    this.title,
    this.content,
    this.authorId,
    this.categoryId,
    this.bannerImageUrl,
    this.views,
    this.likes,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      authorId: json['author_id'],
      categoryId: json['category_id'],
      bannerImageUrl: json['banner_image_url'],
      views: json['views'],
      likes: json['likes'],
      comments: json['comments'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  News copyWith({
    String? id,
    String? title,
    String? content,
    String? authorId,
    String? categoryId,
    String? bannerImageUrl,
    int? views,
    int? likes,
    int? comments,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? categoryName,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      categoryId: categoryId ?? this.categoryId,
      bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categoryName: categoryName ?? this.categoryName,
    );
  }

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
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'category_name': categoryName,
    };
  }
}
