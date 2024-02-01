class ProfileModel1 {
  final String? displayName;
  final String? email;
  final bool? emailVerified;
  final bool? isAnonymous;
  final String? phoneNumber;
  final String? photoURL;
  final String? refreshToken;
  final String? uid;
  final String? name;

  ProfileModel1( {
    this.displayName,
    this.email,
    this.emailVerified,
    this.isAnonymous,
    this.phoneNumber,
    this.photoURL,
    this.refreshToken,
    this.uid,
    this.name,
  });

  factory ProfileModel1.fromJson(Map<String, dynamic> data) {
    return ProfileModel1(
      displayName: data["displayName"],
      email: data["email"],
      emailVerified: data["emailVerified"],
      isAnonymous: data["isAnonymous"],
      phoneNumber: data["phoneNumber"],
      photoURL: data["photoURL"],
      refreshToken: data["refreshToken"],
      uid: data["uid"],
      name:data["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "displayName": displayName,
      "email": email,
      "emailVerified": emailVerified,
      "isAnonymous": isAnonymous,
      "photoURL": photoURL,
      "phoneNumber": phoneNumber,
      "name":name,
    };
  }
}