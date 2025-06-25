import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'head_form_controller.dart';



class SummarySubmitScreen extends StatelessWidget {
  SummarySubmitScreen({super.key});

  final HeadFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Please review your details before submitting.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSummaryItem("Name", controller.profileName),
                  _buildSummaryItem("Email", controller.contactEmail),
                  _buildSummaryItem("Phone", controller.contactPhone),
                  _buildSummaryItem("City", controller.addressCity),
                  _buildSummaryItem("Pincode", controller.addressPincode),
                  // You can add all other fields here from controller
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => controller.previousStep(),
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => controller.submitHeadForm(),
                  child: const Text("Submit"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, RxString value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Obx(() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(value.value),
          ),
        ],
      )),
    );
  }
}
