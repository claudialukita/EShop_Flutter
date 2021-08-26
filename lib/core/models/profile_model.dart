class ProfileModel {
  final String id;
  final String email;
  final String phone;
  final String passwordEncrypted;
  final String name;
  final String gender;
  final String birthday;
  final double point;
  final String instagramUrl;
  final String photoUrl;

  ProfileModel(this.id, this.email, this.phone, this.passwordEncrypted, this.name, this.gender, this.birthday, this.point, this.instagramUrl, this.photoUrl);
}