import 'package:flutter/material.dart';
import 'package:my_portfolio/core/provider/skills_provider.dart';
import 'package:provider/provider.dart';

class AdminSkillsScreen extends StatefulWidget {
  const AdminSkillsScreen({Key? key}) : super(key: key);

  @override
  _AdminSkillsScreenState createState() => _AdminSkillsScreenState();
}

class _AdminSkillsScreenState extends State<AdminSkillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills Management'),
      ),
      body: Center(child: Consumer<SkillsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const CircularProgressIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Skills List:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: provider.skills.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      'Skill ${index + 1}: ${provider.skills[index]}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  openEditDialog(provider);
                },
                child: const Text('Add Skill'),
              ),
            ],
          );
        },
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<SkillsProvider>(context, listen: false).fetchSkills();
  }

  Future<void> openEditDialog(SkillsProvider provider) async {
    String newSkill = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Skill'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  newSkill = value;
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
                await provider.addSkill(newSkill);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
