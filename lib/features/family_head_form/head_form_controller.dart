import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/family_head_model.dart';

class HeadFormController extends GetxController {
  // Step 1: Profile Info
  var name = ''.obs, age = ''.obs, gender = ''.obs, maritalStatus = ''.obs;
  var occupation = ''.obs, samajName = ''.obs, qualification = ''.obs;

  var nameError = RxnString(),
      ageError = RxnString(),
      genderError = RxnString(),
      maritalStatusError = RxnString(),
      occupationError = RxnString(),
      samajNameError = RxnString(),
      qualificationError = RxnString();

  // Step 2: Personal Info
  var birthDate = ''.obs, bloodGroup = ''.obs, natureOfDuties = ''.obs;

  var birthDateError = RxnString(),
      bloodGroupError = RxnString(),
      natureOfDutiesError = RxnString();

  // Step 3: Contact Info
  var contactEmail = ''.obs, contactPhone = ''.obs, contactAlternate = ''.obs;
  var contactLandline = ''.obs, contactSocial = ''.obs;

  var contactEmailError = RxnString(), contactPhoneError = RxnString();

  // Step 4: Address Info
  var addressFlat = ''.obs, addressBuilding = ''.obs, addressStreet = ''.obs;
  var addressLandmark = ''.obs, addressCity = ''.obs, addressDistrict = ''.obs;
  var addressState = ''.obs,
      addressNativeCity = ''.obs,
      addressNativeState = ''.obs;
  var addressCountry = ''.obs, addressPincode = ''.obs;

  var addressFlatError = RxnString(),
      addressBuildingError = RxnString(),
      addressStreetError = RxnString(),
      addressCityError = RxnString(),
      addressStateError = RxnString(),
      addressCountryError = RxnString(),
      addressPincodeError = RxnString();

  // Navigation
  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < 4) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  void updateFieldAndClearError(String field, String value) {
    updateField(field, value);
    clearError(field);
  }

  void updateField(String field, String value) {
    switch (field) {
      case 'name': name.value = value; break;
      case 'age': age.value = value; break;
      case 'gender': gender.value = value; break;
      case 'maritalStatus': maritalStatus.value = value; break;
      case 'occupation': occupation.value = value; break;
      case 'samajName': samajName.value = value; break;
      case 'qualification': qualification.value = value; break;
      case 'birthDate': birthDate.value = value; break;
      case 'bloodGroup': bloodGroup.value = value; break;
      case 'natureOfDuties': natureOfDuties.value = value; break;
      case 'contactEmail': contactEmail.value = value; break;
      case 'contactPhone': contactPhone.value = value; break;
      case 'addressFlat': addressFlat.value = value; break;
      case 'addressBuilding': addressBuilding.value = value; break;
      case 'addressStreet': addressStreet.value = value; break;
      case 'addressCity': addressCity.value = value; break;
      case 'addressState': addressState.value = value; break;
      case 'addressCountry': addressCountry.value = value; break;
      case 'addressPincode': addressPincode.value = value; break;
    }
  }

  void clearError(String field) {
    switch (field) {
      case 'name': nameError.value = null; break;
      case 'age': ageError.value = null; break;
      case 'gender': genderError.value = null; break;
      case 'maritalStatus': maritalStatusError.value = null; break;
      case 'occupation': occupationError.value = null; break;
      case 'samajName': samajNameError.value = null; break;
      case 'qualification': qualificationError.value = null; break;
      case 'birthDate': birthDateError.value = null; break;
      case 'bloodGroup': bloodGroupError.value = null; break;
      case 'natureOfDuties': natureOfDutiesError.value = null; break;
      case 'contactEmail': contactEmailError.value = null; break;
      case 'contactPhone': contactPhoneError.value = null; break;
      case 'addressFlat': addressFlatError.value = null; break;
      case 'addressBuilding': addressBuildingError.value = null; break;
      case 'addressStreet': addressStreetError.value = null; break;
      case 'addressCity': addressCityError.value = null; break;
      case 'addressState': addressStateError.value = null; break;
      case 'addressCountry': addressCountryError.value = null; break;
      case 'addressPincode': addressPincodeError.value = null; break;
    }
  }

  // Validations – Only on "Next"
  bool validateProfileFieldsIndividually() {
    bool valid = true;

    if (name.value.trim().isEmpty) { nameError.value = 'Name is required'; valid = false; }
    if (age.value.trim().isEmpty) { ageError.value = 'Age is required'; valid = false; }
    if (gender.value.trim().isEmpty) { genderError.value = 'Gender is required'; valid = false; }
    if (maritalStatus.value.trim().isEmpty) { maritalStatusError.value = 'Marital Status is required'; valid = false; }
    if (occupation.value.trim().isEmpty) { occupationError.value = 'Occupation is required'; valid = false; }
    if (samajName.value.trim().isEmpty) { samajNameError.value = 'Samaj Name is required'; valid = false; }
    if (qualification.value.trim().isEmpty) { qualificationError.value = 'Qualification is required'; valid = false; }

    return valid;
  }

  bool validatePersonalFields() {
    bool valid = true;

    if (birthDate.value.trim().isEmpty) { birthDateError.value = 'Birth Date is required'; valid = false; }
    if (bloodGroup.value.trim().isEmpty) { bloodGroupError.value = 'Blood Group is required'; valid = false; }
    if (natureOfDuties.value.trim().isEmpty) { natureOfDutiesError.value = 'Nature of Duties is required'; valid = false; }

    return valid;
  }

  bool validateContactFields() {
    bool valid = true;

    final email = contactEmail.value.trim();
    final phone = contactPhone.value.trim();

    final emailRegex = RegExp(
      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
    );

    if (email.isEmpty) {
      contactEmailError.value = 'Email is required';
      valid = false;
    } else if (!emailRegex.hasMatch(email)) {
      contactEmailError.value = 'Invalid email address';
      valid = false;
    } else {
      contactEmailError.value = null;
    }

    if (phone.isEmpty) {
      contactPhoneError.value = 'Phone is required';
      valid = false;
    } else {
      contactPhoneError.value = null;
    }

    return valid;
  }


  bool validateAddressFields() {
    bool valid = true;

    if (addressFlat.value.trim().isEmpty) { addressFlatError.value = 'Flat/House is required'; valid = false; }
    if (addressBuilding.value.trim().isEmpty) { addressBuildingError.value = 'Building is required'; valid = false; }
    if (addressStreet.value.trim().isEmpty) { addressStreetError.value = 'Street is required'; valid = false; }
    if (addressCity.value.trim().isEmpty) { addressCityError.value = 'City is required'; valid = false; }
    if (addressState.value.trim().isEmpty) { addressStateError.value = 'State is required'; valid = false; }
    if (addressCountry.value.trim().isEmpty) { addressCountryError.value = 'Country is required'; valid = false; }
    if (addressPincode.value.trim().isEmpty) { addressPincodeError.value = 'Pincode is required'; valid = false; }

    return valid;
  }

  Future<void> submitHeadForm() async {

    bool isValid = validateProfileFieldsIndividually() &&
        validatePersonalFields() &&
        validateContactFields() &&
        validateAddressFields();

    if (!isValid) {
      Get.snackbar("⚠️ Validation Failed", "Please correct all required fields.");
      return;
    }

    final model = FamilyHeadModel(
      name: name.value,
      age: age.value,
      gender: gender.value,
      maritalStatus: maritalStatus.value,
      occupation: occupation.value,
      samajName: samajName.value,
      qualification: qualification.value,
      birthDate: birthDate.value,
      bloodGroup: bloodGroup.value,
      natureOfDuties: natureOfDuties.value,
      contactEmail: contactEmail.value,
      contactPhone: contactPhone.value,
      contactAlternate: contactAlternate.value,
      contactLandline: contactLandline.value,
      contactSocial: contactSocial.value,
      addressFlat: addressFlat.value,
      addressBuilding: addressBuilding.value,
      addressStreet: addressStreet.value,
      addressLandmark: addressLandmark.value,
      addressCity: addressCity.value,
      addressDistrict: addressDistrict.value,
      addressState: addressState.value,
      addressCountry: addressCountry.value,
      addressPincode: addressPincode.value,
      addressNativeState: addressNativeState.value,
      addressNativeCity: addressNativeCity.value,
    );

    try {

      await FirebaseFirestore.instance
          .collection('family_heads')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        ...model.toMap(),
        'isRegistrationCompleted': true,
      });


      Get.snackbar("✅ Success", "Form submitted successfully!");
    } catch (e) {
      print("❌ Firestore Error: $e");
      Get.snackbar("Error", "Failed to submit. Try again.");
    }
  }



  // Convenience Getters
  RxString get profileName => name;
  RxString get contactEmailDisplay => contactEmail;
  RxString get contactPhoneDisplay => contactPhone;
  RxString get addressCityDisplay => addressCity;
  RxString get addressPincodeDisplay => addressPincode;
}
