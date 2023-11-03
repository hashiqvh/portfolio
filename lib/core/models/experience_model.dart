class ExperienceModel {
  final String name;
  final String location;
  final String startDate;
  final String endDate;
  final String role;
  final String image;
  final String description;
  final String url;
  final List<Project> projects;

  ExperienceModel({
    required this.name,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.role,
    required this.image,
    required this.description,
    required this.url,
    required this.projects,
  });

  factory ExperienceModel.fromMap(Map<String, dynamic> json) => ExperienceModel(
        name: json["name"],
        location: json["location"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        role: json["role"],
        image: json["image"],
        description: json["description"],
        url: json["url"],
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "location": location,
        "startDate": startDate,
        "endDate": endDate,
        "role": role,
        "image": image,
        "description": description,
        "url": url,
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Project {
  String projectName;
  String projectUrl;
  String projectUrlAndroid;
  String projectUrlIos;

  Project({
    required this.projectName,
    required this.projectUrl,
    required this.projectUrlAndroid,
    required this.projectUrlIos,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        projectName: json["project_name"],
        projectUrl: json["project_url"],
        projectUrlAndroid: json['project_android_url'],
        projectUrlIos: json['project_ios_url'],
      );

  Map<String, dynamic> toJson() => {
        "project_name": projectName,
        "project_url": projectUrl,
        "project_android_url": projectUrlAndroid,
        "project_ios_url": projectUrlIos,
      };
}
