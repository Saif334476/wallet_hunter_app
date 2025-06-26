import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallet_hunter_app/models/profile_model.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var profileData = ProfileModel().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }

  void getProfileData() async {
    isLoading.value = true;
    try {
      final doc = await _firestore.collection('family_heads').doc(_auth.currentUser?.uid).get();
      if (doc.exists) {
        profileData.value = ProfileModel.fromMap(doc.data()!);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile data');
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}