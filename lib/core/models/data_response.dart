import 'package:my_portfolio/core/models/experience_model.dart';
import 'package:my_portfolio/core/models/project_model.dart';
import 'package:my_portfolio/core/models/user_model.dart';

class DataResponse {
  final UserModel? userModel;
  final List<ProjectModel> projects;
  final List<ExperienceModel> workExperiences;

  DataResponse({
    required this.userModel,
    required this.projects,
    required this.workExperiences,
  });
}
