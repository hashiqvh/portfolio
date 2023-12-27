class ProjectModel {
  final int? id;
  final int experienceId;
  final String name;
  final String description;
  String imageUrl;
  final String appUrl;
  final String iosUrl;
  final dynamic webAppUrl;
  final String githubUrl;
  final List<String> words;
  ProjectModel({
    this.id,
    required this.experienceId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.appUrl,
    required this.iosUrl,
    required this.webAppUrl,
    required this.githubUrl,
    required this.words,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    print("Response from ProjectModel ${json.toString()}");
    return ProjectModel(
      id: json["id"],
      experienceId: json["experience_id"],
      description: json["description"],
      imageUrl: json["image_url"] ?? '',
      appUrl: json["app_url"],
      iosUrl: json["ios_url"],
      webAppUrl: json["web_app_url"],
      githubUrl: json["github_url"],
      name: json["name"],
      words: json["words"] == null
          ? []
          : List<String>.from(json["words"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "experience_id": experienceId,
        "name": name,
        "description": description,
        "image_url": imageUrl,
        "app_url": appUrl,
        "ios_url": iosUrl,
        "web_app_url": webAppUrl,
        "github_url": githubUrl,
      };
}
