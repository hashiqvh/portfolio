// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int id;
  final String name;
  final String jobName;
  final String description;
  final String about;
  final String companyName;
  final String url;
  final String githubUrl;
  final String linkedinUrl;
  final String twitterUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.jobName,
    required this.description,
    required this.about,
    required this.companyName,
    required this.url,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.twitterUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        jobName: json["job_name"] ?? "",
        description: json["description"] ?? "",
        about: json["about"] ?? "",
        companyName: json["company_name"] ?? "",
        url: json["url"] ?? "",
        githubUrl: json["github_url"] ?? "",
        linkedinUrl: json["linkedin_url"] ?? "",
        twitterUrl: json["twitter_url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "job_name": jobName,
        "description": description,
        "about": about,
        "company_name": companyName,
        "url": url,
        "github_url": githubUrl,
        "linkedin_url": linkedinUrl,
        "twitter_url": twitterUrl,
      };
}
