import 'package:get/get.dart';

class FamilyMemberFormController extends GetxController {

  var name = ''.obs, age = ''.obs, gender = ''.obs, relation = ''.obs;
  var education = ''.obs, profession = ''.obs;

  var nameError = RxnString(),
      ageError = RxnString(),
      genderError = RxnString(),
      relationError = RxnString(),
      educationError = RxnString(),
      professionError = RxnString();


  var birthDate = ''.obs, bloodGroup = ''.obs, disability = ''.obs;

  var birthDateError = RxnString(),
      bloodGroupError = RxnString(),
      disabilityError = RxnString();


  var contactEmail = ''.obs, contactPhone = ''.obs, contactAlternate = ''.obs;
  var contactEmailError = RxnString(),
      contactPhoneError = RxnString(),
      contactAlternateError = RxnString();


  var addressFlat = ''.obs,
      addressBuilding = ''.obs,
      addressStreet = ''.obs,
      addressLandmark = ''.obs,
      addressCountry = ''.obs,
      addressState = ''.obs,
      addressCity = ''.obs,
      addressDistrict = ''.obs,
      addressPincode = ''.obs;

  var addressFlatError = RxnString(),
      addressBuildingError = RxnString(),
      addressStreetError = RxnString(),
      addressLandmarkError = RxnString(),
      addressCountryError = RxnString(),
      addressStateError = RxnString(),
      cityError = RxnString(),
      addressDistrictError = RxnString(),
      addressPincodeError = RxnString();

  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < 4) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  void updateField(String field, String value) {
    switch (field) {
      case 'name': name.value = value; break;
      case 'age': age.value = value; break;
      case 'gender': gender.value = value; break;
      case 'relation': relation.value = value; break;
      case 'education': education.value = value; break;
      case 'profession': profession.value = value; break;
      case 'birthDate': birthDate.value = value; break;
      case 'bloodGroup': bloodGroup.value = value; break;
      case 'disability': disability.value = value; break;
      case 'contactEmail': contactEmail.value = value; break;
      case 'contactPhone': contactPhone.value = value; break;
      case 'contactAlternate': contactAlternate.value = value; break;
      case 'addressFlat': addressFlat.value = value; break;
      case 'addressBuilding': addressBuilding.value = value; break;
      case 'addressStreet': addressStreet.value = value; break;
      case 'addressLandmark': addressLandmark.value = value; break;
      case 'addressCountry': addressCountry.value = value; break;
      case 'addressState': addressState.value = value; break;
      case 'addressCity': addressCity.value = value; break;
      case 'addressDistrict': addressDistrict.value = value; break;
      case 'addressPincode': addressPincode.value = value; break;
    }
  }

  void clearError(String field) {
    switch (field) {
      case 'name': nameError.value = null; break;
      case 'age': ageError.value = null; break;
      case 'gender': genderError.value = null; break;
      case 'relation': relationError.value = null; break;
      case 'education': educationError.value = null; break;
      case 'profession': professionError.value = null; break;
      case 'birthDate': birthDateError.value = null; break;
      case 'bloodGroup': bloodGroupError.value = null; break;
      case 'disability': disabilityError.value = null; break;
      case 'contactEmail': contactEmailError.value = null; break;
      case 'contactPhone': contactPhoneError.value = null; break;
      case 'contactAlternate': contactAlternateError.value = null; break;
      case 'addressFlat': addressFlatError.value = null; break;
      case 'addressBuilding': addressBuildingError.value = null; break;
      case 'addressStreet': addressStreetError.value = null; break;
      case 'addressLandmark': addressLandmarkError.value = null; break;
      case 'addressCountry': addressCountryError.value = null; break;
      case 'addressState': addressStateError.value = null; break;
      case 'addressCity': cityError.value = null; break;
      case 'addressDistrict': addressDistrictError.value = null; break;
      case 'addressPincode': addressPincodeError.value = null; break;
    }
  }

  void updateFieldAndClearError(String field, String value) {
    updateField(field, value);
    clearError(field);
  }

  // Validation Methods
  bool validateProfileStep() {
    bool valid = true;

    if (name.value.isEmpty) {
      nameError.value = 'Name is required';
      valid = false;
    }
    if (age.value.isEmpty) {
      ageError.value = 'Age is required';
      valid = false;
    }
    if (gender.value.isEmpty) {
      genderError.value = 'Gender is required';
      valid = false;
    }
    if (relation.value.isEmpty) {
      relationError.value = 'Relation is required';
      valid = false;
    }

    return valid;
  }

  bool validatePersonalStep() {
    bool valid = true;

    if (birthDate.value.isEmpty) {
      birthDateError.value = 'Birth date is required';
      valid = false;
    }
    if (bloodGroup.value.isEmpty) {
      bloodGroupError.value = 'Blood group is required';
      valid = false;
    }

    return valid;
  }

  bool validateContactStep() {
    bool valid = true;

    if (contactEmail.value.isEmpty) {
      contactEmailError.value = 'Email is required';
      valid = false;
    }

    if (contactPhone.value.isEmpty) {
      contactPhoneError.value = 'Phone is required';
      valid = false;
    }

    return valid;
  }

  bool validateAddressStep() {
    bool valid = true;

    if (addressFlat.value.isEmpty) {
      addressFlatError.value = 'Flat number is required';
      valid = false;
    }
    if (addressBuilding.value.isEmpty) {
      addressBuildingError.value = 'Building is required';
      valid = false;
    }
    if (addressStreet.value.isEmpty) {
      addressStreetError.value = 'Street is required';
      valid = false;
    }
    if (addressCountry.value.isEmpty) {
      addressCountryError.value = 'Country is required';
      valid = false;
    }
    if (addressState.value.isEmpty) {
      addressStateError.value = 'State is required';
      valid = false;
    }
    if (addressCity.value.isEmpty) {
      cityError.value = 'City is required';
      valid = false;
    }
    if (addressPincode.value.isEmpty) {
      addressPincodeError.value = 'Pincode is required';
      valid = false;
    }

    return valid;
  }

  void submitMember() {
    print("✅ Family member submitted:");
    print("Name: ${name.value}, Age: ${age.value}, Relation: ${relation.value}");
    Get.snackbar("Success", "Family member added successfully!");
  }
}
