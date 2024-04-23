import 'dart:convert';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/check_internet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

String _basicAuth = 'Basic ${base64Encode(utf8.encode('osama:osama1234567'))}';

Map<String, String> myheaders = {'authorization': _basicAuth};

// uoesntgnfgtxryuz
class Curd {
/*
  Use it to check the Internet, then send the request to the server,
  but if there is no Internet,return case from type status Request,
*/
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<Either<StatusRequest, Map>> postRequest(String url, Map data) async {
    if (await checkInternet()) {
      var request = await http.post(Uri.parse(url), body: data);
      print("intocurd ..........................${request.statusCode}");
      if (request.statusCode == 200 || request.statusCode == 201) {
        var response = json.decode(request.body);
        print("response:.................intoCurd:$response");
        return Right(response);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  logOutFromGoogle() async {
    await googleSignIn.signOut();
  }
}
