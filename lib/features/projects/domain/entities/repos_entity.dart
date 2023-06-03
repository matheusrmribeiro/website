class ReposEntity {
  ReposEntity({
    required this.name,
    required this.url,
    required this.description,
    required this.stargazersCount,
    required this.updatedAt,
    required this.topics,
  });

  final String name;
  final String url;
  final String? description;
  final int stargazersCount;
  final String updatedAt;
  final List<String> topics;

  static ReposEntity mapper(Map<String, dynamic> response) => ReposEntity(
        name: response["name"],
        url: response["svn_url"],
        updatedAt: response["updated_at"],
        description: response["description"],
        stargazersCount: response["stargazers_count"],
        topics: (response["topics"] as List).map((e) => e as String).toList(),
      );
}
