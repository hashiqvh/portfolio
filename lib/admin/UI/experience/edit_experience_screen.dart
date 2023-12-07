import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/experience/widget/project_form_tile.dart';
import 'package:my_portfolio/const/diments.dart';
import 'package:my_portfolio/core/models/experience_model.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:provider/provider.dart';

class AdminAddExperienceScreen extends StatefulWidget {
  final ExperienceModel? experienceToEdit;

  const AdminAddExperienceScreen({Key? key, this.experienceToEdit})
      : super(key: key);

  @override
  _AdminAddExperienceScreenState createState() =>
      _AdminAddExperienceScreenState();
}

class _AdminAddExperienceScreenState extends State<AdminAddExperienceScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyUrlController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Project> projectFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.experienceToEdit != null
            ? 'Edit Work Experience'
            : 'Add Work Experience'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding * 5),
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            controller: locationController,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          TextFormField(
            controller: startDateController,
            decoration: const InputDecoration(labelText: 'Start Date'),
          ),
          TextFormField(
            controller: endDateController,
            decoration: const InputDecoration(labelText: 'End Date'),
          ),
          TextFormField(
            controller: roleController,
            decoration: const InputDecoration(labelText: 'Role'),
          ),
          TextFormField(
            controller: imageController,
            decoration: const InputDecoration(labelText: 'Image URL'),
          ),
          TextFormField(
            controller: companyUrlController,
            decoration: const InputDecoration(labelText: 'Company URL'),
          ),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Projects"),
          const SizedBox(
            height: 10,
          ),
          // Display the project fields
          if (projectFields.isNotEmpty)
            ListView.builder(
                shrinkWrap: true,
                itemCount: projectFields.length,
                itemBuilder: (context, index) => ProjectFormTile(
                      project: projectFields[index],
                      onDelete: (name) {
                        setState(() {
                          projectFields.removeWhere(
                              (element) => element.projectName == name);
                        });
                      },
                      ontap: (p) {
                        Provider.of<WorkExperienceProvider>(context,
                                listen: false)
                            .updateExperienceProject(
                                widget.experienceToEdit!.name, p);
                      },
                    )),

          ElevatedButton(
            onPressed: () {
              setState(() {
                projectFields.add(Project(
                  projectName: "",
                  projectUrl: "",
                  projectUrlAndroid: "",
                  projectUrlIos: "",
                ));
              });
            },
            child: const Text('Add Project'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              final updatedExperience = ExperienceModel(
                  name: nameController.text,
                  location: locationController.text,
                  startDate: startDateController.text,
                  endDate: endDateController.text,
                  role: roleController.text,
                  image: imageController.text,
                  description: descriptionController.text,
                  projects: projectFields,
                  url: companyUrlController.text);
              final workExperienceProvider =
                  Provider.of<WorkExperienceProvider>(context, listen: false);

              if (widget.experienceToEdit != null) {
                // Edit the existing experience
                workExperienceProvider.updateExperience(updatedExperience);
              } else {
                // Add the new experience
                workExperienceProvider.workExperiences.add(updatedExperience);
              }

              await workExperienceProvider.updateWorkExperiences();
              Navigator.pop(context);
            },
            child: Text(widget.experienceToEdit != null
                ? 'Save Changes'
                : 'Add Experience'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Check if there's an experience to edit
    if (widget.experienceToEdit != null) {
      // If editing an existing experience, populate the fields with its data
      nameController.text = widget.experienceToEdit!.name;
      locationController.text = widget.experienceToEdit!.location;
      startDateController.text = widget.experienceToEdit!.startDate;
      endDateController.text = widget.experienceToEdit!.endDate;
      roleController.text = widget.experienceToEdit!.role;
      imageController.text = widget.experienceToEdit!.image;
      descriptionController.text = widget.experienceToEdit!.description;

      projectFields.addAll(widget.experienceToEdit!.projects);
    }
  }

  ///  function to update the project in the list
  void updateProjectInList(int index, Project updatedProject) {
    setState(() {
      projectFields[index] = updatedProject;
    });
  }
}
