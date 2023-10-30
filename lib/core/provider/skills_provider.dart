import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SkillsProvider extends ChangeNotifier {
  List<String> _skills = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<String> get skills => _skills;

  // Function to add a new skill
  Future<void> addSkill(String newSkill) async {
    _isLoading = true;

    try {
      final firestore = FirebaseFirestore.instance;
      final skillsCollection = firestore.collection("skills");

      final querySnapshot = await skillsCollection.get();
      final docId = querySnapshot.docs.first.id;

      final updatedSkills = [...skills, newSkill];

      await skillsCollection.doc(docId).update({
        'skills': updatedSkills,
      });

      _skills = updatedSkills;
    } catch (error) {
      print('Error adding skill: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createInitialSkillsData() async {
    final firestore = FirebaseFirestore.instance;
    final skillsCollection = firestore.collection("skills");

    final initialData = {
      'skills': [],
    };

    await skillsCollection.add(initialData);

    _skills = [];
    notifyListeners();
  }

  // Function to fetch the "Skills" data from Firestore
  Future<void> fetchSkills() async {
    _isLoading = true;

    try {
      final firestore = FirebaseFirestore.instance;
      final skillsCollection = firestore.collection("skills");

      final querySnapshot = await skillsCollection.get();

      if (querySnapshot.docs.isNotEmpty) {
        final skillData = querySnapshot.docs.first.data();
        final skillsList = skillData['skills'] as List<dynamic>;

        _skills = skillsList.map((skill) => skill.toString()).toList();
      } else {
        await createInitialSkillsData();
      }
    } catch (error) {
      print('Error fetching skills: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
