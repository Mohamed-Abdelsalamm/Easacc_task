import 'package:dartz/dartz.dart';
import 'package:easacc_flutter_task/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(ServerFailure('Google sign-in cancelled'));
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      if (userCredential.user == null) {
        return Left(ServerFailure('Failed to sign in with Google'));
      }

      return Right(userCredential.user!);
    } catch (e) {
      return Left(ServerFailure('Google sign-in failed: ${e.toString()}'));
    }
  }

  Future<Either<Failure, User>> signInWithFacebook() async {
    try {
      await _facebookAuth.logOut();

      final LoginResult result = await _facebookAuth.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);

        final UserCredential userCredential = await _auth.signInWithCredential(
          facebookAuthCredential,
        );

        if (userCredential.user == null) {
          return Left(ServerFailure('Failed to sign in with Facebook'));
        }

        return Right(userCredential.user!);
      } else if (result.status == LoginStatus.cancelled) {
        return Left(ServerFailure('Facebook sign-in cancelled'));
      } else {
        return Left(
          ServerFailure('Facebook sign-in failed: ${result.message}'),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return Left(
          ServerFailure(
            'Invalid Facebook credentials. Please try again or contact support.',
          ),
        );
      }
      return Left(
        ServerFailure('Facebook authentication failed: ${e.message}'),
      );
    } catch (e) {
      return Left(ServerFailure('Facebook sign-in failed: ${e.toString()}'));
    }
  }

  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
      _facebookAuth.logOut(),
    ]);
  }

  Future<String?> getIdToken() async {
    return await _auth.currentUser?.getIdToken();
  }
}
