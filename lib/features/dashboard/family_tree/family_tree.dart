import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'family_tree_controller.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class FamilyTreeScreen extends StatelessWidget {
  FamilyTreeScreen({super.key});
  final controller = Get.put(FamilyTreeController());

  @override
  Widget build(BuildContext context) {
    controller.generateSampleTree();

    return Scaffold(
      body: Stack(children: [
        Obx(() {
          if (controller.rootNode.value == null) {
            return const Center(child: Text("No data available"));
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 110, right: 24.0, left: 24),
              child: _buildTree(controller.rootNode.value!),
            ),
          );
        }),
        Positioned(
          top: 60,
          right: 20,
          child: IconButton(
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Color(0xFF2074B5),
              size: 30,
            ),
            onPressed: () => _exportToPdf(),
          ),
        )
      ]),
    );
  }

  Widget _buildTree(FamilyMemberNode node) {
    if (node.children.isEmpty) {
      return _buildNodeWidget(node.name);
    }

    return Column(
      children: [
        _buildNodeWidget(node.name),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: node.children.map((child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _buildTree(child),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _buildNodeWidget(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade700),
      ),
      child: Text(
        name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  void _exportToPdf() async {
    final doc = pw.Document();
    final node = controller.rootNode.value;
    if (node == null) return;

    List<pw.Widget> buildPdfNodes(FamilyMemberNode node, int indent) {
      List<pw.Widget> list = [];
      list.add(
        pw.Padding(
          padding: pw.EdgeInsets.only(left: indent * 16.0),
          child: pw.Text('- ${node.name}',
              style: const pw.TextStyle(fontSize: 14)),
        ),
      );
      for (var child in node.children) {
        list.addAll(buildPdfNodes(child, indent + 1));
      }
      return list;
    }

    doc.addPage(
      pw.Page(
        build: (context) => pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: buildPdfNodes(node, 0),
          ),
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => doc.save());
  }

  List<pw.Widget> _buildPdfNodes(FamilyMemberNode node, int indent) {
    List<pw.Widget> list = [];
    list.add(
      pw.Padding(
        padding: pw.EdgeInsets.only(left: indent * 16.0),
        child:
            pw.Text("- ${node.name}", style: const pw.TextStyle(fontSize: 14)),
      ),
    );
    for (var child in node.children) {
      list.addAll(_buildPdfNodes(child, indent + 1));
    }
    return list;
  }
}
