class Profile {
  String? fullname;
  String? email;
  String? phoneNumber;

  Profile({this.fullname, this.email, this.phoneNumber});
}

class AuthData {
  String? phoneNumber, phoneCode, pin, fullname, email, dob, gender, referralCode, address, city;

  AuthData(
      {this.phoneCode,
      this.phoneNumber,
      this.pin,
      this.fullname,
      this.email,
      this.dob,
      this.gender,
      this.referralCode,
      this.address,
      this.city});
}

Profile getProfile() {
  return Profile(fullname: 'Jennifer Lesmana', phoneNumber: '+6281234567890', email: 'jlesmana@gmail.com');
}
