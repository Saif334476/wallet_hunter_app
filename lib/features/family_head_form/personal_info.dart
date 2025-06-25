import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_hunter_app/features/family_head_form/head_form_controller.dart';
import 'package:wallet_hunter_app/widgets/custom_text_field.dart';
import '../../widgets/custom_dropdown.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

  final HeadFormController controller = Get.find();

  final List<String> bloodGroups = [
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
  ];

  Future<void> _pickDate(BuildContext context) async {
    final initialDate = controller.birthDate.value.isNotEmpty
        ? DateFormat.yMd().parse(controller.birthDate.value)
        : DateTime.now().subtract(const Duration(days: 365 * 20));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (ctx, child) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        return Theme(
          data: isDark
              ? ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Theme.of(ctx).colorScheme.primary,
              onPrimary: Theme.of(ctx).colorScheme.onPrimary,
              onSurface: Theme.of(ctx).colorScheme.onSurface,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(ctx).colorScheme.primary,
              ),
            ),
          )
              : ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(ctx).colorScheme.primary,
              onPrimary: Theme.of(ctx).colorScheme.onPrimary,
              onSurface: Theme.of(ctx).colorScheme.onSurface,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(ctx).colorScheme.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      controller.updateFieldAndClearError(
        'birthDate',
        DateFormat.yMd().format(picked),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Birth Date Field (Reactive)
          Obx(() {
            return TextFormField(
              readOnly: true,
              onTap: () => _pickDate(context),
              controller: TextEditingController(
                text: controller.birthDate.value,
              ),
              decoration: InputDecoration(
                labelText: "Birth Date",
                errorText: controller.birthDateError.value,
                suffixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[900]
                    : Colors.grey[200],
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            );
          }),

          const SizedBox(height: 16),

          /// Blood Group Dropdown (Reactive)
          Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdownField(
                  label: "Blood Group",
                  selectedValue: controller.bloodGroup.value,
                  options: bloodGroups,
                  onChanged: (val) {
                    controller.updateFieldAndClearError('bloodGroup', val);
                  },
                ),
                if (controller.bloodGroupError.value != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 12),
                    child: Text(
                      controller.bloodGroupError.value!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  )
              ],
            );
          }),

          const SizedBox(height: 16),

          /// Nature of Duties TextField (Reactive)
          Obx(() {
            return CustomTextField(
              label: "Exact Nature of Duties",
              initialValue: controller.natureOfDuties.value,
              onChanged: (v) =>
                  controller.updateFieldAndClearError('natureOfDuties', v),
              errorText: controller.natureOfDutiesError.value,
            );
          }),
        ],
      ),
    );
  }
}
