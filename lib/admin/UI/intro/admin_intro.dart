import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/portal_master_layout.dart';
import 'package:my_portfolio/core/provider/intro_provider.dart';
import 'package:provider/provider.dart';

class AdminIntroScreen extends StatefulWidget {
  const AdminIntroScreen({Key? key}) : super(key: key);

  @override
  _AdminIntroScreenState createState() => _AdminIntroScreenState();
}

class _AdminIntroScreenState extends State<AdminIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
      body: Center(
        child: Consumer<IntroProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Introductory Content:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                Text(
                  'Title One: ${provider.introductoryContent['title_one']}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Title Two: ${provider.introductoryContent['title_two']}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Title Three: ${provider.introductoryContent['title_three']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    openEditDialog(provider);
                  },
                  child: const Text('Edit Introductory Content'),
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
    Provider.of<IntroProvider>(context, listen: false)
        .fetchIntroductoryContent();
  }

  Future<void> openEditDialog(IntroProvider introProvider) async {
    Map<String, dynamic> updatedContent = {
      ...introProvider.introductoryContent
    };

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Introductory Content'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                initialValue: introProvider.introductoryContent['title_one'],
                onChanged: (value) {
                  updatedContent['title_one'] = value;
                },
              ),
              TextFormField(
                initialValue: introProvider.introductoryContent['title_two'],
                onChanged: (value) {
                  updatedContent['title_two'] = value;
                },
              ),
              TextFormField(
                initialValue: introProvider.introductoryContent['title_three'],
                onChanged: (value) {
                  updatedContent['title_three'] = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                introProvider.updateIntroductoryContent(updatedContent);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
