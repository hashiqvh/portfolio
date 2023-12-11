import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/portal_master_layout.dart';
import 'package:my_portfolio/admin/UI/project/edit_add_project.dart';
import 'package:my_portfolio/admin/components/text_tile.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/const/diments.dart';
import 'package:my_portfolio/core/models/project_model.dart';
import 'package:my_portfolio/core/provider/project_provider.dart';
import 'package:provider/provider.dart';

class AdminProjectsScreen extends StatefulWidget {
  const AdminProjectsScreen({Key? key}) : super(key: key);

  @override
  _AdminProjectsScreenState createState() => _AdminProjectsScreenState();
}

class _AdminProjectsScreenState extends State<AdminProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
      body: Center(
        child: Consumer<ProjectsProvider>(
          builder: (context, provider, child) {
            if (provider.isLoadingProjects) {
              return const CircularProgressIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Projects:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.projects.length,
                    itemBuilder: (BuildContext context, int index) {
                      final project = provider.projects[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: kDefaultPadding,
                          right: kDefaultPadding,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: kDefaultPadding),
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            // border: Border.all(
                            //     width: 2,
                            //     color: primaryColor.withOpacity(0.15)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultPadding),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextTile(
                                      heading: "Project Name",
                                      text: project.name,
                                    ),
                                    TextTile(
                                      heading: "Project Description",
                                      text: project.description.toString(),
                                    ),
                                    TextTile(
                                      heading: "Github",
                                      text: project.githubUrl.toString(),
                                    ),
                                    TextTile(
                                      heading: "App Store",
                                      text: project.iosUrl.toString(),
                                    ),
                                    TextTile(
                                      heading: "Play Store",
                                      text: project.appUrl.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  openEditDialog(project, provider);
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    openEditDialog(null, provider);
                  },
                  child: const Text('Add Project'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ProjectsProvider>(context, listen: false).fetchProjects();
  }

  Future<void> openEditDialog(
      ProjectModel? project, ProjectsProvider projectsProvider) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditAddProjectScreen(project: project),
      ),
    );
  }
}
