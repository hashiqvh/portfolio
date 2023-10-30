import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/portal_master_layout.dart';
import 'package:my_portfolio/const/diments.dart';
import 'package:my_portfolio/core/provider/about_provider.dart';
import 'package:provider/provider.dart';

class AdminAboutUsScreen extends StatefulWidget {
  const AdminAboutUsScreen({Key? key}) : super(key: key);

  @override
  _AdminAboutUsScreenState createState() => _AdminAboutUsScreenState();
}

class _AdminAboutUsScreenState extends State<AdminAboutUsScreen> {
  late TextEditingController contentController;
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(body: Consumer<AboutUsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!isEditing) {
          contentController.text = provider.aboutUsData['content'];
        }

        return Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'About Us Data:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              isEditing
                  ? TextFormField(
                      controller: contentController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                    )
                  : Text(
                      contentController.text,
                      style: const TextStyle(fontSize: 18),
                    ),
              const SizedBox(height: 16),
              isEditing
                  ? ElevatedButton(
                      onPressed: () {
                        provider.updateAboutUsData(
                            {'content': contentController.text});
                        setState(() {
                          isEditing = false;
                        });
                      },
                      child: const Text('Save'),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      child: const Text('Edit About Us Data'),
                    ),
            ],
          ),
        );
      },
    ));
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<AboutUsProvider>(context, listen: false).fetchAboutUsData();
    contentController = TextEditingController();
  }
}
