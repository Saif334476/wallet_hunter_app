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
                onChanged: (v) => controller.updateFieldAndClearError('name', v),
              )),
          Obx(() => CustomTextField(
                label: "Age",
                initialValue: controller.age.value,
                keyboardType: TextInputType.number,
                errorText: controller.ageError.value,
                onChanged: (v) => controller.updateFieldAndClearError('age', v),
              )),
          Obx(() => CustomDropdownField(
                label: "Gender",
                selectedValue: controller.gender.value,
                options: const ["Male", "Female", "Other"],
                errorText: controller.genderError.value,
                onChanged: (v) => controller.updateFieldAndClearError('gender', v),
              )),
          Obx(
            () => CustomDropdownField(
              label: "Samaj Name",
              selectedValue: controller.samajName.value,
              options: const [
                "Lohana",
                "Modh Vanik",
                "Patel",
                "Brahmin",
                "Baniya",
                "Rajput",
                "Other"
              ],
              errorText: controller.samajNameError.value,
              onChanged: (value) {
                controller.updateFieldAndClearError('samajName', value);
              },
            ),
          ),

          Obx(() => CustomTextField(
                label: "Occupation",
                initialValue: controller.occupation.value,
                errorText: controller.occupationError.value,
                onChanged: (v) => controller.updateFieldAndClearError('occupation', v),
              )),


        ],
      ),
    );
  }
}
