import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'family_tree_controller.dart';

class FamilyTreeScreen extends StatelessWidget {
  FamilyTreeScreen({super.key});

  final FamilyTreeController controller = Get.put(FamilyTreeController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final head = controller.head.value;
        final members = controller.members;

        if (head == null) {
          return const Center(child: Text("No Head profile found."));
        }

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),

              const Text(
                "Family Tree",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xFF2074B5),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTree(
                        node: head,
                        children: members,
                        theme: theme,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTree({
    required Map<String, dynamic> node,
    required List<Map<String, dynamic>> children,
    required ThemeData theme,
  }) {
    return Column(
      children: [
        _buildNode(
          name: node["name"],
          relation: node["relation"],
          profilePicUrl: node["profilePicUrl"],
          theme: theme,
        ),
        if (children.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 2,
                  height: children.length * 120,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Column(
                  children: children.map((child) {
                    return _buildTree(
                      node: child,
                      children: [], // Add child nodes here if needed
                      theme: theme,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildNode({
    required String name,
    required String relation,
    required String profilePicUrl,
    required ThemeData theme,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: theme.colorScheme.primaryContainer,
          child: profilePicUrl.isEmpty
              ? Icon(Icons.person,
              size: 40, color: theme.colorScheme.onPrimaryContainer)
              : ClipOval(
            child: Image.network(
              profilePicUrl,
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          relation,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}