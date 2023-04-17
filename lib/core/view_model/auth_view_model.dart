import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:khoroga/model/user_model.dart';
import 'package:khoroga/view/home_view.dart';

import '../../service/firestore_user.dart';

class AuthViewModel extends GetxController{
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes:['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin= FacebookLogin();

   String email= "";
   String password="";
   String name="";

  Rxn<User> _user = Rxn<User>();

  get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user?.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod()async{
    // final GoogleSignInAccount googleUser= 
    final GoogleSignInAccount? googleUser=await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication=
    await googleUser!.authentication;

    final AuthCredential credential= GoogleAuthProvider.credential(
        idToken:googleSignInAuthentication.idToken ,
        accessToken:googleSignInAuthentication.accessToken
    );

   await _auth.signInWithCredential(credential).then((user)async {
       saveUser(user);
       Get.offAll(()=>HomeView());
      } );

  }
  void facebookSignInMethod() async {
    FacebookLoginResult result =  await _facebookLogin.logIn();
    final accessToken= result.accessToken!.token;
    if(result.status==FacebookLoginStatus.success){
      final faceCredential= FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential).then((user)async {
       saveUser(user);
       Get.offAll(()=>HomeView());
      } );
    }
  }
  void signInWithEmailAndPassword() async{

    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(()=>HomeView());
    }catch(e){
        Get.snackbar("Error", "User does not exist", colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }

  }

  void createAccountWithEmailAndPassword() async{

    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user)async {
       saveUser(user);
      } );
     
           
      Get.offAll(()=>HomeView());
    }catch(e){
        Get.snackbar("Error", "User does not exist", colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }

  }

  void saveUser(UserCredential user)async{
    await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user!.uid,
          email: user.user!.email,
          name:name==null ? user.user!.displayName : name,
          pic:'',

    ));
  }
}