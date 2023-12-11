import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/experience/edit_experience_screen.dart';
import 'package:my_portfolio/admin/UI/portal_master_layout.dart';
import 'package:my_portfolio/admin/components/text_tile.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/const/diments.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:provider/provider.dart';

class AdminWorkExperienceScreen extends StatefulWidget {
  const AdminWorkExperienceScreen({Key? key}) : super(key: key);

  @override
  _AdminWorkExperienceScreenState createState() =>
      _AdminWorkExperienceScreenState();
}

class _AdminWorkExperienceScreenState extends State<AdminWorkExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 05),
        child: Consumer<WorkExperienceProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Work Experiences',
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminAddExperienceScreen(),
                          ),
                        );
                      },
                      child: const Text('Add Work Experience'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (value.isLoaded)
                  const Center(child: CircularProgressIndicator())
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.workExperiences.length,
                      itemBuilder: (BuildContext context, int index) {
                        final experience = value.workExperiences[index];
                        return Container(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextTile(
                                        heading: "Name of Company",
                                        text: experience.companyName,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      TextTile(
                                        heading: "Location of Company",
                                        text: experience.location,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      TextTile(
                                        heading: "From",
                                        text: experience.startDate,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      TextTile(
                                        heading: "To",
                                        text: experience.endDate,
                                      ),
                                    ],
                                  ),
                                  TextTile(
                                    heading: "Description of work",
                                    text: experience.description,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminAddExperienceScreen(
                                        experienceToEdit: experience,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 16),
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
    final workExperienceProvider =
        Provider.of<WorkExperienceProvider>(context, listen: false);
    workExperienceProvider.fetchWorkExperiences();
  }
}
