import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/project_model.dart';
import 'package:my_portfolio/core/provider/project_provider.dart';
import 'package:provider/provider.dart';

class EditAddProjectScreen extends StatefulWidget {
  final ProjectModel? project;

  const EditAddProjectScreen({super.key, this.project});

  @override
  _EditAddProjectScreenState createState() => _EditAddProjectScreenState();
}

class _EditAddProjectScreenState extends State<EditAddProjectScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> imageList = [];
  TextEditingController playStoreUrlController = TextEditingController();
  TextEditingController githubUrlController = TextEditingController();
  TextEditingController appStoreUrlController = TextEditingController();

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isEditing ? 'Edit Project' : 'Add Project'),
        ),
        body: Consumer<ProjectsProvider>(
          builder: (context, projectsProvider, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Project Name'),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                ElevatedButton(
                  onPressed: _uploadImages,
                  child: const Text('Upload Images'),
                ),
                if (imageList.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Uploaded Images:'),
                      for (final imageUrl in imageList)
                        Row(
                          children: [
                            Expanded(child: Text(imageUrl)),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  imageList.remove(imageUrl);
                                });
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                TextFormField(
                  controller: playStoreUrlController,
                  decoration:
                      const InputDecoration(labelText: 'Play Store URL'),
                ),
                TextFormField(
                  controller: githubUrlController,
                  decoration: const InputDecoration(labelText: 'GitHub URL'),
                ),
                TextFormField(
                  controller: appStoreUrlController,
                  decoration: const InputDecoration(labelText: 'App Store URL'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final description = descriptionController.text;
                    final playStoreUrl = playStoreUrlController.text;
                    final githubUrl = githubUrlController.text;
                    final appStoreUrl = appStoreUrlController.text;

                    if (name.isNotEmpty && description.isNotEmpty) {
                      final updatedProject = ProjectModel(
                        name: name,
                        description: description,
                        imageList: imageList.isNotEmpty ? imageList : null,
                        playStoreUrl:
                            playStoreUrl.isNotEmpty ? playStoreUrl : null,
                        githubUrl: githubUrl.isNotEmpty ? githubUrl : null,
                        appStoreUrl:
                            appStoreUrl.isNotEmpty ? appStoreUrl : null,
                      );
                      var projects = projectsProvider.projects;
                      if (isEditing) {
                        // Editing an existing project

                        final int index = projects.indexOf(widget.project!);
                        setState(() {
                          projects[index] = updatedProject;
                        });
                      } else {
                        // Adding a new project
                        setState(() {
                          projects.add(updatedProject);
                        });
                      }
                      // Update Firestore with the new content
                      projectsProvider.updateProjects(projects);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    if (widget.project != null) {
      isEditing = true;
      nameController.text = widget.project!.name ?? '';
      descriptionController.text = widget.project!.description ?? '';
      if (widget.project!.imageList != null) {
        imageList.addAll(widget.project!.imageList!);
      }
      playStoreUrlController.text = widget.project!.playStoreUrl ?? '';
      githubUrlController.text = widget.project!.githubUrl ?? '';
      appStoreUrlController.text = widget.project!.appStoreUrl ?? '';
    }
  }

  Future<void> _uploadImages() async {
    FilePickerResult? result;

    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
    } catch (e) {
      print(e);
    }

    if (result != null) {
      final firebaseStorage = FirebaseStorage.instance;

      for (final file in result.files) {
        try {
          final Uint8List uploadFile = file.bytes!;

          final String fileName = file.name;

          Reference storageRef =
              firebaseStorage.ref().child('project_images/$fileName');

          final UploadTask uploadTask = storageRef.putData(uploadFile);

          final TaskSnapshot downloadUrl = await uploadTask;

          final String imageUrl = (await downloadUrl.ref.getDownloadURL());

          setState(() {
            imageList.add(imageUrl);
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
