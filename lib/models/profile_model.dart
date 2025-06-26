class ProfileModel {
  String? name;
  String? phoneNumber;
  String? birthDate;
  String? bloodGroup;
  String? natureOfDuties;

  ProfileModel({
    this.name,
    this.phoneNumber,
    this.birthDate,
    this.bloodGroup,
    this.natureOfDuties,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      birthDate: map['birthDate'],
      bloodGroup: map['bloodGroup'],
      natureOfDuties: map['natureOfDuties'],
    );
  }
}