import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/portal_master_layout.dart';
import 'package:my_portfolio/const/diments.dart';
import 'package:my_portfolio/core/provider/user_data_provider.dart';
import 'package:provider/provider.dart';

class AdminAboutUsScreen extends StatefulWidget {
  const AdminAboutUsScreen({super.key});

  @override
  State<AdminAboutUsScreen> createState() => _AdminAboutUsScreenState();
}

class _AdminAboutUsScreenState extends State<AdminAboutUsScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController jobController = TextEditingController();

  final TextEditingController introController = TextEditingController();

  final TextEditingController urlController = TextEditingController();

  final TextEditingController gitUrlController = TextEditingController();

  final TextEditingController linkedInController = TextEditingController();

  final TextEditingController twitterController = TextEditingController();

  final TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
      body: Scaffold(
          appBar: AppBar(
            title: const Text('Admin About Us Form'),
          ),
          body: Consumer<UserDataProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // Initialize user values to controllers
                intializeUserValue(value.userModel);
                return Padding(
                  padding: const EdgeInsets.all(kDefaultPadding * 03),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration:
                                const InputDecoration(labelText: 'Name'),
                          ),
                          TextFormField(
                            controller: jobController,
                            decoration: const InputDecoration(labelText: 'Job'),
                          ),
                          TextFormField(
                            controller: introController,
                            decoration: const InputDecoration(
                                labelText: 'Introduction'),
                          ),
                          TextFormField(
                            controller: urlController,
                            decoration: const InputDecoration(labelText: 'URL'),
                          ),
                          TextFormField(
                            controller: gitUrlController,
                            decoration:
                                const InputDecoration(labelText: 'GitHub URL'),
                          ),
                          TextFormField(
                            controller: linkedInController,
                            decoration: const InputDecoration(
                                labelText: 'LinkedIn URL'),
                          ),
                          TextFormField(
                            controller: twitterController,
                            decoration:
                                const InputDecoration(labelText: 'Twitter URL'),
                          ),
                          TextFormField(
                            controller: aboutController,
                            maxLines: 10,
                            decoration:
                                const InputDecoration(labelText: 'About'),
                          ),
                          const SizedBox(
                              height:
                                  16.0), // Add some space between fields and the button
                          ElevatedButton(
                            onPressed: () {
                              // Handle the save button press
                              saveForm();
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          )),
    );
  }

  @override
  void initState() {
    Provider.of<UserDataProvider>(context, listen: false).getUserData();
    // TODO: implement initState
    super.initState();
  }

  intializeUserValue(userModel) {
    Future(() {
      setState(() {
        nameController.text = userModel!.name;
        jobController.text = userModel!.jobName;
        introController.text = userModel!.description;
        urlController.text = userModel!.url;
        gitUrlController.text = userModel!.githubUrl;
        linkedInController.text = userModel!.linkedinUrl;
        twitterController.text = userModel!.twitterUrl;
        aboutController.text = userModel!.about;
      });
    });
  }

  void saveForm() {
    // Implement your logic to save the form data
    print('Name: ${nameController.text}');
    print('Job: ${jobController.text}');
    print('Introduction: ${introController.text}');
    print('URL: ${urlController.text}');
    print('GitHub URL: ${gitUrlController.text}');
    print('LinkedIn URL: ${linkedInController.text}');
    print('Twitter URL: ${twitterController.text}');
    print('About: ${aboutController.text}');
  }
}
