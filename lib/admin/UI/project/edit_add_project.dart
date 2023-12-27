import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_portfolio/admin/UI/project/widget/base64_image_preview.dart';
import 'package:my_portfolio/admin/UI/project/widget/company_name_dropdown.dart';
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

  TextEditingController playStoreUrlController = TextEditingController();
  TextEditingController githubUrlController = TextEditingController();
  TextEditingController appStoreUrlController = TextEditingController();
  TextEditingController webUrlController = TextEditingController();
  bool isEditing = false;

  XFile? _selectedImage;
  int selectedExperience = 0;
  String? _base64Image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isEditing ? 'Edit Project' : 'Add Project'),
        ),
        body: Consumer<ProjectsProvider>(
          builder: (context, projectsProvider, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: 'Project Name'),
                  ),
                  CompanyNameDropdown(
                    onCompanySelected: (selectedCompany) {
                      setState(() {
                        selectedExperience = selectedCompany.id!;
                      });
                      // Handle the selected company
                      print('Selected Company: $selectedCompany');
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.project != null
                      ? Base64ImagePreview(
                          base64Image: widget.project!.imageUrl,
                          onReupload: _pickImage)
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              color: Colors.grey[300],
                              child: _selectedImage != null
                                  ? Image.network(
                                      _selectedImage!.path,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    )
                                  : null,
                            ),
                            if (_selectedImage == null)
                              ElevatedButton(
                                onPressed: _pickImage,
                                child: const Text('Select Image'),
                              ),
                            if (_selectedImage != null)
                              Positioned(
                                top: 10,
                                right: 10,
                                child: IconButton(
                                  icon: const Icon(Icons.remove_circle),
                                  onPressed: _removeImage,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                  const SizedBox(
                    height: 10,
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
                    decoration:
                        const InputDecoration(labelText: 'App Store URL'),
                  ),
                  TextFormField(
                    controller: webUrlController,
                    decoration: const InputDecoration(labelText: 'Web URL'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text;
                      final description = descriptionController.text;
                      final playStoreUrl = playStoreUrlController.text;
                      final githubUrl = githubUrlController.text;
                      final appStoreUrl = appStoreUrlController.text;
                      final webUrl = webUrlController.text;
                      var projectModel = ProjectModel(
                        experienceId: selectedExperience,
                        words: [],
                        name: name,
                        description: description ?? "",
                        imageUrl: _base64Image ?? "",
                        appUrl: playStoreUrl ?? "",
                        iosUrl: appStoreUrl ?? "",
                        webAppUrl: webUrl ?? "",
                        githubUrl: githubUrl ?? "",
                      );
                      if (widget.project != null) {
                        Provider.of<ProjectsProvider>(context, listen: false)
                            .updateProjects(
                                projectModel, context, widget.project!.id!);
                      } else {
                        Provider.of<ProjectsProvider>(context, listen: false)
                            .addProjects(projectModel, context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();

    if (widget.project != null) {
      isEditing = true;
      selectedExperience = widget.project!.experienceId;
      nameController.text = widget.project!.name ?? '';
      descriptionController.text = widget.project!.description ?? '';

      playStoreUrlController.text = widget.project!.appUrl ?? '';
      githubUrlController.text = widget.project!.githubUrl ?? '';
      appStoreUrlController.text = widget.project!.iosUrl ?? '';
      webUrlController.text = widget.project!.webAppUrl ?? "";
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(Uint8List.fromList(bytes));

      setState(() {
        _selectedImage = pickedFile;
        widget.project!.imageUrl = "";
        _base64Image = base64Image;
      });
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _base64Image = null;
    });
  }
}
