// import 'package:flutter/material.dart';
// import 'package:my_portfolio/const/diments.dart';
// import 'package:my_portfolio/core/models/experience_model.dart';
// import 'package:my_portfolio/core/provider/work_experience_provider.dart';
// import 'package:provider/provider.dart';

// class AdminAddExperienceScreen extends StatefulWidget {
//   const AdminAddExperienceScreen({Key? key}) : super(key: key);

//   @override
//   _AdminAddExperienceScreenState createState() =>
//       _AdminAddExperienceScreenState();
// }

// class _AdminAddExperienceScreenState extends State<AdminAddExperienceScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController companyUrlController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController startDateController = TextEditingController();
//   TextEditingController endDateController = TextEditingController();
//   TextEditingController roleController = TextEditingController();
//   TextEditingController imageController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController projectNameController = TextEditingController();
//   TextEditingController androidUrlController = TextEditingController();
//   TextEditingController iosUrlController = TextEditingController();
//   TextEditingController urlController = TextEditingController();
//   List<TextEditingController> projectControllers = [];
//   List<Project> projectFields = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Work Experience'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(kDefaultPadding * 5),
//         child: ListView(
//           children: <Widget>[
//             TextFormField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: locationController,
//               decoration: const InputDecoration(labelText: 'Location'),
//             ),
//             TextFormField(
//               controller: startDateController,
//               decoration: const InputDecoration(labelText: 'Start Date'),
//             ),
//             TextFormField(
//               controller: endDateController,
//               decoration: const InputDecoration(labelText: 'End Date'),
//             ),
//             TextFormField(
//               controller: roleController,
//               decoration: const InputDecoration(labelText: 'Role'),
//             ),
//             TextFormField(
//               controller: imageController,
//               decoration: const InputDecoration(labelText: 'Image URL'),
//             ),
//             TextFormField(
//               controller: descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//             ),
//             // Display the project fields
//             if (projectFields.isNotEmpty)
//               ...projectFields.map((e) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Name : ${e.projectName}"),
//                     Text("URL : ${e.projectUrl}"),
//                     Text("Android : ${e.projectUrlAndroid}"),
//                     Text("iOS : ${e.projectUrlIos}"),
//                   ],
//                 );
//               }),
//             Column(
//               children: <Widget>[
//                 TextFormField(
//                   controller: projectNameController,
//                   decoration: const InputDecoration(labelText: 'Project Name'),
//                 ),
//                 TextFormField(
//                   controller: urlController,
//                   decoration: const InputDecoration(labelText: 'Project URL'),
//                 ),
//                 TextFormField(
//                   controller: androidUrlController,
//                   decoration: const InputDecoration(labelText: 'Android URL'),
//                 ),
//                 TextFormField(
//                   controller: iosUrlController,
//                   decoration: const InputDecoration(labelText: 'IOS URL'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       projectFields.add(Project(
//                           projectName: projectNameController.text,
//                           projectUrl: urlController.text,
//                           projectUrlAndroid: androidUrlController.text,
//                           projectUrlIos: iosUrlController.text));
//                     });
//                   },
//                   child: const Text('Add Project'),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 final updatedExperience = ExperienceModel(
//                   name: nameController.text,
//                   location: locationController.text,
//                   startDate: startDateController.text,
//                   endDate: endDateController.text,
//                   role: roleController.text,
//                   image: imageController.text,
//                   description: descriptionController.text,
//                   url: urlController.text,
//                   projects: projectFields,
//                 );
//                 final workExperienceProvider =
//                     Provider.of<WorkExperienceProvider>(context, listen: false);
//                 workExperienceProvider.workExperiences.add(updatedExperience);
//                 await workExperienceProvider.updateWorkExperiences();
//                 // Implement the logic to add the work experience and its projects
//                 // You can access the field values using nameController.text, locationController.text, etc.
//                 // Also, access the project details from projectControllers.

//                 // After adding, navigate back to the previous screen.
//                 Navigator.pop(context);
//               },
//               child: const Text('Add Experience'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
