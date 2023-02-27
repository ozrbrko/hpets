import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignHelper {

  static GoogleSignHelper _instance = GoogleSignHelper._private();
  GoogleSignHelper._private();

  static GoogleSignHelper get instance{
    return _instance;
  }

   final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<GoogleSignInAccount?> signIn() async {
    final user = await _googleSignIn.signIn();
    if(user!= null){
      print(user.email);
      return user;
    }
    return null;
  }

  Future<GoogleSignInAuthentication> googleAuthenticate() async {
     if(await _googleSignIn.isSignedIn()){
       final user =  _googleSignIn.currentUser;
       final userData = await user!.authentication;
       // print(userData.accessToken);
       return userData;
     }
    return null!;
  }

  Future<GoogleSignInAccount?> signOut() async {
    final user = await _googleSignIn.signOut();
    if(user!= null){
      print(user.email);
      return user;
    }
    return null;
  }

  Future<User?> firebaseSignIn() async {
    // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleAuthenticate();

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user =(await _auth.signInWithCredential(credential)).user;
    print(user!.displayName);
    return user;
  }
}