import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_hunter_app/features/family_head_form/head_form_controller.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';
import '../../widgets/custom_dropdown.dart';

class ProfileInfoScreen extends StatelessWidget {
  ProfileInfoScreen({super.key});

  final HeadFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: "Full Name",
              initialValue: controller.name.value,
              onChanged: (v) => controller.updateField('name', v),
            ),
            CustomTextField(
              label: "Age",
              initialValue: controller.age.value,
              onChanged: (v) => controller.updateField('age', v),
              keyboardType: TextInputType.number,
            ),
            CustomDropdownField(
              label: "Gender",
              selectedValue: controller.gender.value,
              options: const ["Male", "Female", "Other"],
              onChanged: (v) => controller.updateField('gender', v),
            ),
            CustomDropdownField(
              label: "Marital Status",
              selectedValue: controller.maritalStatus.value,
              options: const ["Single", "Married", "Divorced", "Widowed"],
              onChanged: (v) => controller.updateField('maritalStatus', v),
            ),
            CustomTextField(
              label: "Occupation",
              initialValue: controller.occupation.value,
              onChanged: (v) => controller.updateField('occupation', v),
            ),
            CustomTextField(
              label: "Samaj Name",
              initialValue: controller.samajName.value,
              onChanged: (v) => controller.updateField('samajName', v),
            ),
            CustomTextField(
              label: "Qualification",
              initialValue: controller.qualification.value,
              onChanged: (v) => controller.updateField('qualification', v),
            ),
          ],
        ),
      ),
    );
  }
}
