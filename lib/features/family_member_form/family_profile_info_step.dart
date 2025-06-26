import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';
import 'package:wallet_hunter_app/features/family_member_form/family_member_form_controller.dart';

class FamilyProfileInfoStep extends StatelessWidget {
  FamilyProfileInfoStep({super.key});

  final FamilyMemberFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => CustomTextField(
            label: "Name",
            initialValue: controller.name.value,
            onChanged: (v) => controller.updateField('name', v),
            errorText: controller.nameError.value,
          )),
          Obx(() => CustomTextField(
            label: "Age",
            keyboardType: TextInputType.number,
            initialValue: controller.age.value,
            onChanged: (v) => controller.updateField('age', v),
            errorText: controller.ageError.value,
          )),
          Obx(() => CustomTextField(
            label: "Gender",
            initialValue: controller.gender.value,
            onChanged: (v) => controller.updateField('gender', v),
            errorText: controller.genderError.value,
          )),
          Obx(() => CustomTextField(
            label: "Relation to Head",
            initialValue: controller.relation.value,
            onChanged: (v) => controller.updateField('relation', v),
            errorText: controller.relationError.value,
          )),
          Obx(() => CustomTextField(
            label: "Education",
            initialValue: controller.education.value,
            onChanged: (v) => controller.updateField('education', v),
            errorText: controller.educationError.value,
          )),
          Obx(() => CustomTextField(
            label: "Profession",
            initialValue: controller.profession.value,
            onChanged: (v) => controller.updateField('profession', v),
            errorText: controller.professionError.value,
          )),
        ],
      ),
    );
  }
}
