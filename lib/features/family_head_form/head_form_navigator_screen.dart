import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:wallet_hunter_app/features/family_head_form/address_info.dart';
import 'package:wallet_hunter_app/features/family_head_form/contact_info.dart';
import 'package:wallet_hunter_app/features/family_head_form/head_form_controller.dart';
import 'package:wallet_hunter_app/features/family_head_form/personal_info.dart';
import 'package:wallet_hunter_app/features/family_head_form/preview_submit.dart';
import 'package:wallet_hunter_app/features/family_head_form/profile_info.dart';
import 'package:wallet_hunter_app/widgets/custom_elevated_button.dart';

class HeadFormNavigatorScreen extends StatelessWidget {
  HeadFormNavigatorScreen({super.key,});
  final controller = Get.put(HeadFormController());


  final List<Widget> steps = [
    ProfileInfoScreen(),
    PersonalInfoScreen(),
    ContactInfoScreen(),
    AddressInfoScreen(),
    SummarySubmitScreen(),
  ];

  final List<String> stepTitles = [
    'Profile',
    'Personal',
    'Contact',
    'Address',
    'Review',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),


            Obx(() => NumberStepper(
              stepRadius: 12,
              numbers: List.generate(steps.length, (index) => index + 1),
              activeStep: controller.currentStep.value,
              enableNextPreviousButtons: false,
              enableStepTapping: false,
              stepColor: Colors.grey.shade300,
              activeStepColor: theme.colorScheme.primary,
              numberStyle: const TextStyle(color: Colors.black),
              activeStepBorderColor: theme.colorScheme.primary,
            )),
            const SizedBox(height: 12),


            Obx(() => Text(
              stepTitles[controller.currentStep.value],
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(height: 12),


            Expanded(
              child: Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: steps[controller.currentStep.value],
              )),
            ),

            const SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  if (controller.currentStep.value > 0)
                    OutlinedButton(
                      onPressed: controller.previousStep,
                      child: const Text('Back'),
                    )
                  else
                    const SizedBox(width: 100),

                CustomElevatedButton(label: controller.currentStep.value ==
                    steps.length - 1
                    ? 'Submit'
                    : 'Next',     onPressed: () {
                  final current = controller.currentStep.value;
                  final isValid = _validateStep(current);
                  if (isValid) {
                    if (current == steps.length - 1) {
                      controller.submitForm();
                    } else {
                      controller.nextStep();
                    }
                  }
                },),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  bool _validateStep(int stepIndex) {
    switch (stepIndex) {
      case 0:
        if (!controller.validateProfileInfo()) {
          Get.snackbar("Error", "Please fill all profile fields");
          return false;
        }
        break;
      case 1:
        if (!controller.validatePersonalInfo()) {
          Get.snackbar("Error", "Please fill all personal info");
          return false;
        }
        break;
      case 2:
        if (!controller.validateContactInfo()) {
          Get.snackbar("Error", "Please fill all contact info");
          return false;
        }
        break;
      case 3:
        if (!controller.validateAddressInfo()) {
          Get.snackbar("Error", "Please fill all address info");
          return false;
        }
        break;
    }
    return true;
  }
}
