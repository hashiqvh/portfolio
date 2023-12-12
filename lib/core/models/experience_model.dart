// To parse this JSON data, do
//
//     final experienceModel = experienceModelFromJson(jsonString);

import 'dart:convert';

import 'package:my_portfolio/core/models/project_model.dart';

ExperienceModel experienceModelFromJson(String str) =>
    ExperienceModel.fromJson(json.decode(str));

String experienceModelToJson(ExperienceModel data) =>
    json.encode(data.toJson());

class ExperienceModel {
  final int? id;
  final String companyName;
  final String companyUrl;
  final String startDate;
  final String endDate;
  final String role;
  final String location;
  final String description;
  final List<String> skills;

  final List<ProjectModel>? projects;

  ExperienceModel({
    this.id,
    required this.startDate,
    required this.role,
    required this.endDate,
    required this.companyName,
    required this.companyUrl,
    required this.description,
    required this.skills,
    required this.location,
    this.projects,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        id: json["id"],
        role: json['role'],
        companyName: json["company_name"],
        startDate: json["start_date"] ?? "",
        endDate: json["end_date"] ?? "",
        companyUrl: json["company_url"],
        description: json["description"],
        location: json['location'],
        skills: List<String>.from(json["skills"].map((x) => x)),
        projects: json["projects"] == null
            ? []
            : List<ProjectModel>.from(
                json["projects"].map((x) => ProjectModel.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "role": role,
        "start_date": startDate,
        "end_date": endDate,
        "company_url": companyUrl,
        "location": location,
        "description": description,
        "skills": List<dynamic>.from(skills.map((x) => x)),
      };
}
