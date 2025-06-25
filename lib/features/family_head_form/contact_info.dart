import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_hunter_app/features/family_head_form/head_form_controller.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';

class ContactInfoScreen extends StatelessWidget {
  ContactInfoScreen({super.key});

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
              label: "Email ID",
              initialValue: controller.contactEmail.value,
              onChanged: (v) => controller.updateField('contactEmail', v),
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              label: "Phone Number",
              initialValue: controller.contactPhone.value,
              onChanged: (v) => controller.updateField('contactPhone', v),
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
              label: "Alternative Number",
              initialValue: controller.contactAlternate.value,
              onChanged: (v) => controller.updateField('contactAlternate', v),
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
              label: "Landline Number",
              initialValue: controller.contactLandline.value,
              onChanged: (v) => controller.updateField('contactLandline', v),
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
              label: "Social Media Link",
              initialValue: controller.contactSocial.value,
              onChanged: (v) => controller.updateField('contactSocial', v),
              keyboardType: TextInputType.url,
            ),
          ],
        ),
      ),
    );
  }
}
