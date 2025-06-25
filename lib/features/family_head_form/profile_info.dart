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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => CustomTextField(
            label: "Full Name",
            initialValue: controller.name.value,
            errorText: controller.nameError.value,
            onChanged: (v) => controller.updateField('name', v),
          )),
          Obx(() => CustomTextField(
            label: "Age",
            initialValue: controller.age.value,
            keyboardType: TextInputType.number,
            errorText: controller.ageError.value,
            onChanged: (v) => controller.updateField('age', v),
          )),
          Obx(() => CustomDropdownField(
            label: "Gender",
            selectedValue: controller.gender.value,
            options: const ["Male", "Female", "Other"],
            errorText: controller.genderError.value,
            onChanged: (v) => controller.updateField('gender', v),
          )),
          Obx(() => CustomDropdownField(
            label: "Marital Status",
            selectedValue: controller.maritalStatus.value,
            options: const ["Single", "Married", "Divorced", "Widowed"],
            errorText: controller.maritalStatusError.value,
            onChanged: (v) => controller.updateField('maritalStatus', v),
          )),
          Obx(() => CustomTextField(
            label: "Occupation",
            initialValue: controller.occupation.value,
            errorText: controller.occupationError.value,
            onChanged: (v) => controller.updateField('occupation', v),
          )),
          Obx(() => CustomTextField(
            label: "Samaj Name",
            initialValue: controller.samajName.value,
            errorText: controller.samajNameError.value,
            onChanged: (v) => controller.updateField('samajName', v),
          )),
          Obx(() => CustomTextField(
            label: "Qualification",
            initialValue: controller.qualification.value,
            errorText: controller.qualificationError.value,
            onChanged: (v) => controller.updateField('qualification', v),
          )),
          
        ],
      ),
    );
  }
}
