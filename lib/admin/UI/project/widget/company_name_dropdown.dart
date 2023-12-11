import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/experience_model.dart';

class CompanyNameDropdown extends StatefulWidget {
  final List<ExperienceModel> experiences;
  final Function(String) onCompanySelected;

  const CompanyNameDropdown({
    Key? key,
    required this.experiences,
    required this.onCompanySelected,
  }) : super(key: key);

  @override
  _CompanyNameDropdownState createState() => _CompanyNameDropdownState();
}

class _CompanyNameDropdownState extends State<CompanyNameDropdown> {
  String? selectedCompany;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCompany,
      hint: const Text('Select Company'),
      onChanged: (value) {
        setState(() {
          selectedCompany = value;
          widget.onCompanySelected(value!);
        });
      },
      items: widget.experiences
          .map<DropdownMenuItem<String>>((ExperienceModel experience) {
        return DropdownMenuItem<String>(
          value: experience.id.toString(),
          child: Text(experience.companyName),
        );
      }).toList(),
    );
  }
}
