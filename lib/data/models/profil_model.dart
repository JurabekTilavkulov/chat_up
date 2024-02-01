class ProfileModel{
  final String displayName;
  final String phoneNumber;
  final String email;

  ProfileModel({ required this.displayName, required this.phoneNumber, required this.email});

  factory ProfileModel.fromJson(Map<String,dynamic>map){
    return ProfileModel(displayName:map['displayName'],phoneNumber: map['phoneNumber'], email:map['email']);
  }
  Map<String,dynamic> toJson(){
    return{
      'displayName':displayName,
      'phoneNumber':phoneNumber,
      'email':email,
    };
  }
}