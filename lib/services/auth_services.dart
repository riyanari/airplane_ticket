import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password
  }) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      UserModel user = await UserServices().getUserById(userCredential.user!.uid);
      return user;
    } catch(e){
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = ''
  }) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 28000000
      );

      await UserServices().setUser(user);

      return user;
    } catch (e){
      throw e;
    }
  }

  Future<void> signOut() async{
    try {
      await _auth.signOut();
    } catch(e){
      throw e;
    }
  }

}