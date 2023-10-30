class ProjectModel {
  final String? name;
  final String? description;
  final List<String>? imageList;
  final String? playStoreUrl;
  final String? githubUrl;
  final String? appStoreUrl;

  ProjectModel({
    this.name,
    this.description,
    this.imageList,
    this.playStoreUrl,
    this.githubUrl,
    this.appStoreUrl,
  });

  // Create a ProjectModel instance from a Map
  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'],
      description: map['description'] ?? "",
      imageList: List<String>.from(map['imageList'] ?? []),
      playStoreUrl: map['playStoreUrl'] ?? "",
      githubUrl: map['githubUrl'] ?? "",
      appStoreUrl: map['appStoreUrl'] ?? "",
    );
  }

  // Convert a ProjectModel instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imageList': imageList,
      'playStoreUrl': playStoreUrl,
      'githubUrl': githubUrl,
      'appStoreUrl': appStoreUrl,
    };
  }
}
