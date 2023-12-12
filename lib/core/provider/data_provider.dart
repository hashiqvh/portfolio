import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/data_response.dart';
import 'package:my_portfolio/core/provider/project_provider.dart';
import 'package:my_portfolio/core/provider/user_data_provider.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier {
  DataResponse _dataResponse = DataResponse(
    projects: [],
    userModel: null,
    workExperiences: [],
  );
  bool _isLoading = false;
  DataResponse get dataResponse => _dataResponse;
  bool get isLoading => _isLoading;

  // Fetch all data
  Future<void> fetchData(BuildContext context) async {
    _isLoading = true;

    var workExperienceProvider =
        Provider.of<WorkExperienceProvider>(context, listen: false);
    var projectsproviderr =
        Provider.of<ProjectsProvider>(context, listen: false);
    var userProvider = Provider.of<UserDataProvider>(context, listen: false);
    try {
      await userProvider.getUserData();
      await workExperienceProvider.fetchWorkExperiences();

      await projectsproviderr.fetchProjects();
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      // Set the response with updated data and loading flags
      _dataResponse = DataResponse(
        projects: projectsproviderr.projects,
        userModel: userProvider.userModel!,
        workExperiences: workExperienceProvider.workExperiences,
      );
      _isLoading = false;
      notifyListeners();
    }
  }
}
