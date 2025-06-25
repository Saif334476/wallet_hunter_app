import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_hunter_app/features/family_head_form/head_form_controller.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';
import 'package:wallet_hunter_app/widgets/place_picker_text_field.dart';

class AddressInfoScreen extends StatelessWidget {
  AddressInfoScreen({super.key});

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
              label: "Flat Number",
              initialValue: controller.addressFlat.value,
              onChanged: (val) => controller.updateField('addressFlat', val),
            ),
            CustomTextField(
              label: "Building Name",
              initialValue: controller.addressBuilding.value,
              onChanged: (val) => controller.updateField('addressBuilding', val),
            ),
            CustomTextField(
              label: "Street Name",
              initialValue: controller.addressStreet.value,
              onChanged: (val) => controller.updateField('addressStreet', val),
            ),
            CustomTextField(
              label: "Landmark",
              initialValue: controller.addressLandmark.value,
              onChanged: (val) => controller.updateField('addressLandmark', val),
            ),

            PlacePickerTextField(
              label: "Search Address",
              onPlaceSelected: ({
                required String city,
                required String state,
                required String country,
                required String pincode,
              }) {
                controller.updateField('addressCity', city);
                controller.updateField('addressState', state);
                controller.updateField('addressCountry', country);
                controller.updateField('addressPincode', pincode);
              },
            ),

            CustomTextField(
              label: "District",
              initialValue: controller.addressDistrict.value,
              onChanged: (val) => controller.updateField('addressDistrict', val),
            ),
            CustomTextField(
              label: "Native City",
              initialValue: controller.addressNativeCity.value,
              onChanged: (val) => controller.updateField('addressNativeCity', val),
            ),
            CustomTextField(
              label: "Native State",
              initialValue: controller.addressNativeState.value,
              onChanged: (val) => controller.updateField('addressNativeState', val),
            ),
          ],
        ),
      ),
    );
  }
}
