import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/experience_model.dart';

class ProjectFormTile extends StatefulWidget {
  final Function(Project) ontap;
  final Function(String) onDelete;
  final Project project;

  const ProjectFormTile(
      {super.key,
      required this.project,
      required this.ontap,
      required this.onDelete});

  @override
  ProjectFormTileState createState() => ProjectFormTileState();
}

class ProjectFormTileState extends State<ProjectFormTile> {
  late TextEditingController projectNameController;
  late TextEditingController projectUrlController;
  late TextEditingController projectUrlAndroidController;
  late TextEditingController projectUrlIosController;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.project.projectName),
      children: [
        ListTile(
          title: TextFormField(
            readOnly: widget.project.projectName.isNotEmpty,
            controller: projectNameController,
            decoration: const InputDecoration(labelText: 'Project Name'),
          ),
        ),
        ListTile(
          title: TextFormField(
            controller: projectUrlController,
            decoration: const InputDecoration(labelText: 'Project URL'),
          ),
        ),
        ListTile(
          title: TextFormField(
            controller: projectUrlAndroidController,
            decoration: const InputDecoration(labelText: 'Android URL'),
          ),
        ),
        ListTile(
          title: TextFormField(
            controller: projectUrlIosController,
            decoration: const InputDecoration(labelText: 'iOS URL'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: ElevatedButton(
                  onPressed: () {
                    saveProjectDetails();
                  },
                  child: const Text('Save'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.onDelete(widget.project.projectName);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    // Initialize controllers with project values
    projectNameController =
        TextEditingController(text: widget.project.projectName);
    projectUrlController =
        TextEditingController(text: widget.project.projectUrl);
    projectUrlAndroidController =
        TextEditingController(text: widget.project.projectUrlAndroid);
    projectUrlIosController =
        TextEditingController(text: widget.project.projectUrlIos);
  }

  void saveProjectDetails() {
    // Access the entered values using controllers
    String projectName = projectNameController.text;
    String projectUrl = projectUrlController.text;
    String projectUrlAndroid = projectUrlAndroidController.text;
    String projectUrlIos = projectUrlIosController.text;

    // Create a Project instance and do something with the data
    Project project = Project(
      projectName: projectName,
      projectUrl: projectUrl,
      projectUrlAndroid: projectUrlAndroid,
      projectUrlIos: projectUrlIos,
    );
    widget.ontap(project);
    // You can now use the 'project' object as needed, for example, save it to a database.
    print('Project Details Saved: ${project.toJson()}');
  }
}
