import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
 Future<UserCredential?> registerUser(String email, String parol) async {
    final userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: parol,);
    final user=userCredential.user;
    print("userRegist ${user}");
    return userCredential;
  }

  loginUser(String email,String parol) async {
   final userCredental=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: parol);
   final user=userCredental.user;
   print("userLogin ${user}");
   print("userLoginRunTimeType ${user.runtimeType}");
   return userCredental;
  }
}