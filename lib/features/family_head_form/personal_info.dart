import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_hunter_app/features/family_head_form/head_form_controller.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

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
              label: "Birth Date",
              initialValue: controller.birthDate.value,
              onChanged: (v) => controller.updateField('birthDate', v),
              keyboardType: TextInputType.datetime,
            ),
            CustomTextField(
              label: "Blood Group",
              initialValue: controller.bloodGroup.value,
              onChanged: (v) => controller.updateField('bloodGroup', v),
            ),
            CustomTextField(
              label: "Exact Nature of Duties",
              initialValue: controller.natureOfDuties.value,
              onChanged: (v) => controller.updateField('natureOfDuties', v),
            ),
          ],
        ),
      ),
    );
  }
}
