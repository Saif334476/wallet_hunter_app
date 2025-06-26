import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_hunter_app/features/family_member_form/family_member_form_controller.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';
import 'package:wallet_hunter_app/widgets/place_picker_text_field.dart';

class FamilyAddressInfoStep extends StatelessWidget {
  FamilyAddressInfoStep({super.key});

  final FamilyMemberFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => CustomTextField(
            label: "Flat Number",
            initialValue: controller.addressFlat.value,
            onChanged: (v) => controller.updateField('addressFlat', v),
            errorText: controller.addressFlatError.value,
          )),
          Obx(() => CustomTextField(
            label: "Building Name",
            initialValue: controller.addressBuilding.value,
            onChanged: (v) => controller.updateField('addressBuilding', v),
            errorText: controller.addressBuildingError.value,
          )),
          Obx(() => CustomTextField(
            label: "Street",
            initialValue: controller.addressStreet.value,
            onChanged: (v) => controller.updateField('addressStreet', v),
            errorText: controller.addressStreetError.value,
          )),
          Obx(() => CustomTextField(
            label: "Landmark",
            initialValue: controller.addressLandmark.value,
            onChanged: (v) => controller.updateField('addressLandmark', v),
            errorText: controller.addressLandmarkError.value,
          )),

          const SizedBox(height: 16),

          /// Country
          Obx(() => PlacePickerTextField(
            label: "Country",
            onSelected: (desc) {
              controller.updateFieldAndClearError('addressCountry', desc);
              controller.updateField('addressState', '');
              controller.updateField('addressCity', '');
              controller.updateField('addressDistrict', '');
            },
            errorText: controller.addressCountryError.value,
          )),

          const SizedBox(height: 16),

          /// State
          Obx(() {
            final country = controller.addressCountry.value;
            return PlacePickerTextField(
              label: "State",
              componentFilter: country.isNotEmpty ? 'country:$country' : null,
              onSelected: (desc) {
                controller.updateFieldAndClearError('addressState', desc);
                controller.updateField('addressCity', '');
                controller.updateField('addressDistrict', '');
              },
              errorText: controller.addressStateError.value,
            );
          }),

          const SizedBox(height: 16),


          Obx(() {
            final state = controller.addressState.value;
            return PlacePickerTextField(
              label: "City",
              componentFilter: state.isNotEmpty ? 'administrative_area_level_1:$state' : null,
              onSelected: (desc) {
                controller.updateFieldAndClearError('addressCity', desc);
                controller.updateField('addressDistrict', '');
              },
             // errorText: controller.addressCityError.value, // ✅ Corrected
            );
          }),

          const SizedBox(height: 16),


          Obx(() {
            final state = controller.addressState.value;
            return PlacePickerTextField(
              label: "District",
              componentFilter: state.isNotEmpty ? 'administrative_area_level_2:$state' : null,
              onSelected: (desc) {
                controller.updateField('addressDistrict', desc);
              },
            );
          }),

          const SizedBox(height: 16),

          /// Pincode
          Obx(() => CustomTextField(
            label: "Pincode",
            keyboardType: TextInputType.number,
            initialValue: controller.addressPincode.value,
            onChanged: (v) => controller.updateField('addressPincode', v),
            errorText: controller.addressPincodeError.value,
          )),
        ],
      ),
    );
  }
}
