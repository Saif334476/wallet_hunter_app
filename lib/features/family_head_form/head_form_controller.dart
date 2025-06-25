import 'package:get/get.dart';

class HeadFormController extends GetxController {

  var name = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var maritalStatus = ''.obs;
  var occupation = ''.obs;
  var samajName = ''.obs;
  var qualification = ''.obs;


  var birthDate = ''.obs;
  var bloodGroup = ''.obs;
  var natureOfDuties = ''.obs;


  var contactEmail = ''.obs;
  var contactPhone = ''.obs;
  var contactAlternate = ''.obs;
  var contactLandline = ''.obs;
  var contactSocial = ''.obs;


  var addressFlat = ''.obs;
  var addressBuilding = ''.obs;
  var addressStreet = ''.obs;
  var addressLandmark = ''.obs;
  var addressCity = ''.obs;
  var addressDistrict = ''.obs;
  var addressState = ''.obs;
  var addressNativeCity = ''.obs;
  var addressNativeState = ''.obs;
  var addressCountry = ''.obs;
  var addressPincode = ''.obs;
  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < 5) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
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
      case 'contactAlternate': contactAlternate.value = value; break;
      case 'contactLandline': contactLandline.value = value; break;
      case 'contactSocial': contactSocial.value = value; break;

      case 'addressFlat': addressFlat.value = value; break;
      case 'addressBuilding': addressBuilding.value = value; break;
      case 'addressStreet': addressStreet.value = value; break;
      case 'addressLandmark': addressLandmark.value = value; break;
      case 'addressCity': addressCity.value = value; break;
      case 'addressDistrict': addressDistrict.value = value; break;
      case 'addressState': addressState.value = value; break;
      case 'addressNativeCity': addressNativeCity.value = value; break;
      case 'addressNativeState': addressNativeState.value = value; break;
      case 'addressCountry': addressCountry.value = value; break;
      case 'addressPincode': addressPincode.value = value; break;
    }
  }

  void submitForm() {
    print("\n--- FORM SUBMITTED ---");
    print("Name: \${name.value}");
    print("Email: \${contactEmail.value}");
    print("Phone: \${contactPhone.value}");
    print("City: \${addressCity.value}");
    print("Pincode: \${addressPincode.value}");
    Get.snackbar("Success", "Registration submitted successfully!");
  }


  bool validateProfileInfo() {
    return name.isNotEmpty &&
        age.isNotEmpty &&
        gender.isNotEmpty &&
        maritalStatus.isNotEmpty &&
        occupation.isNotEmpty &&
        samajName.isNotEmpty &&
        qualification.isNotEmpty;
  }

  bool validatePersonalInfo() {
    return birthDate.isNotEmpty &&
        bloodGroup.isNotEmpty &&
        natureOfDuties.isNotEmpty;
  }

  bool validateContactInfo() {
    return contactEmail.isNotEmpty &&
        contactPhone.isNotEmpty;
  }

  bool validateAddressInfo() {
    return addressFlat.isNotEmpty &&
        addressBuilding.isNotEmpty &&
        addressStreet.isNotEmpty &&
        addressCity.isNotEmpty &&
        addressState.isNotEmpty &&
        addressCountry.isNotEmpty &&
        addressPincode.isNotEmpty;
  }


  RxString get profileName => name;
  RxString get contactEmailDisplay => contactEmail;
  RxString get contactPhoneDisplay => contactPhone;
  RxString get addressCityDisplay => addressCity;
  RxString get addressPincodeDisplay => addressPincode;
}
