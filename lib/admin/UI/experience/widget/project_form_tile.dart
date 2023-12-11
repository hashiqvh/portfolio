import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/project_model.dart';

class ProjectFormTile extends StatefulWidget {
  final Function(ProjectModel) ontap;
  final Function(String) onDelete;
  final ProjectModel project;

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
      title: Text(widget.project.name),
      children: [
        ListTile(
          title: TextFormField(
            readOnly: widget.project.name.isNotEmpty,
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
                widget.onDelete(widget.project.name);
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
    projectNameController = TextEditingController(text: widget.project.name);
    projectUrlController =
        TextEditingController(text: widget.project.webAppUrl);
    projectUrlAndroidController =
        TextEditingController(text: widget.project.appUrl);
    projectUrlIosController =
        TextEditingController(text: widget.project.iosUrl);
  }

  void saveProjectDetails() {}
}
