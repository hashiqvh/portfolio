import 'package:flutter/material.dart';
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

  TextEditingController descriptionController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

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
            controller: skillsController,
            decoration: const InputDecoration(labelText: 'skills'),
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
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              String enteredSkills = skillsController.text.trim();
              List<String> skills = enteredSkills
                  .split(',')
                  .map((skill) => skill.trim())
                  .toList();

              ExperienceModel experienceModel = ExperienceModel(
                startDate: startDateController.text,
                role: roleController.text,
                endDate: endDateController.text,
                companyName: nameController.text,
                companyUrl: companyUrlController.text,
                description: descriptionController.text,
                skills: skills,
                location: locationController.text,
              );
              if (widget.experienceToEdit != null) {
                Provider.of<WorkExperienceProvider>(context, listen: false)
                    .updateExperience(
                        context, experienceModel, widget.experienceToEdit!.id!);
              } else {
                Provider.of<WorkExperienceProvider>(context, listen: false)
                    .addExperience(context, experienceModel);
              }
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
      nameController.text = widget.experienceToEdit!.companyName;
      locationController.text = widget.experienceToEdit!.location;
      startDateController.text = widget.experienceToEdit!.startDate;
      endDateController.text = widget.experienceToEdit!.endDate;
      roleController.text = widget.experienceToEdit!.role;
      List<String> skills = widget.experienceToEdit!.skills;

      skillsController.text = skills.join(', ');
      companyUrlController.text = widget.experienceToEdit!.companyUrl;
      descriptionController.text = widget.experienceToEdit!.description;
    }
  }
}
