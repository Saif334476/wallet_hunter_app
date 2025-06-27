import 'package:get/get.dart';

class FamilyMemberNode {
  final String name;
  final List<FamilyMemberNode> children;

  FamilyMemberNode({required this.name, this.children = const []});
}

class FamilyTreeController extends GetxController {
  Rx<FamilyMemberNode?> rootNode = Rx<FamilyMemberNode?>(null);

  void generateSampleTree() {
    rootNode.value = FamilyMemberNode(
      name: "Head",
      children: [
        FamilyMemberNode(name: "Child 1"),
        FamilyMemberNode(name: "Child 2", children: [
          FamilyMemberNode(name: "Grandchild 1"),
          FamilyMemberNode(name: "Grandchild 2"),
        ]),
        FamilyMemberNode(name: "Child 3"),
      ],
    );
  }
}
