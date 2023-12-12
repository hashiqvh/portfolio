import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/experience_model.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:provider/provider.dart';

class CompanyNameDropdown extends StatefulWidget {
  final Function(ExperienceModel) onCompanySelected;

  const CompanyNameDropdown({
    Key? key,
    required this.onCompanySelected,
  }) : super(key: key);

  @override
  _CompanyNameDropdownState createState() => _CompanyNameDropdownState();
}

class _CompanyNameDropdownState extends State<CompanyNameDropdown> {
  ExperienceModel? selectedCompany;

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkExperienceProvider>(
      builder: (context, provider, child) => DropdownButton<ExperienceModel>(
        value: selectedCompany,
        hint: const Text('Select Company'),
        onChanged: (value) {
          setState(() {
            selectedCompany = value;
            widget.onCompanySelected(value!);
          });
        },
        items: provider.workExperiences.map<DropdownMenuItem<ExperienceModel>>(
            (ExperienceModel experience) {
          return DropdownMenuItem<ExperienceModel>(
            value: experience,
            child: Text(experience.companyName),
          );
        }).toList(),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<WorkExperienceProvider>(context, listen: false)
        .fetchWorkExperiences();
    super.initState();
  }
}
