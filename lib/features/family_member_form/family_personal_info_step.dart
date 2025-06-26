import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';
import 'package:wallet_hunter_app/features/family_member_form/family_member_form_controller.dart';

import '../../widgets/custom_birth_date_text_field.dart';

class FamilyPersonalInfoStep extends StatelessWidget {
  FamilyPersonalInfoStep({super.key});

  final FamilyMemberFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BirthDateField(
            dateValue: controller.birthDate,
            errorValue: controller.birthDateError,
            onDatePicked: (value) =>
                controller.updateFieldAndClearError('birthDate', value),
          ),

          Obx(() => CustomTextField(
            label: "Blood Group",
            initialValue: controller.bloodGroup.value,
            onChanged: (v) => controller.updateField('bloodGroup', v),
            errorText: controller.bloodGroupError.value,
          )),
          // Obx(() => CustomTextField(
          //   label: "Medical Conditions",
          //   initialValue: controller.medicalCondition.value,
          //   onChanged: (v) => controller.updateField('medicalCondition', v),
          //   errorText: controller.medicalConditionError.value,
          // )),
        ],
      ),
    );
  }
}
