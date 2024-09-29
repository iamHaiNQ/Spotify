import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either<String, String>> signup(CreateUserReq createUserReq);

  Future<Either<String, String>> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either<String, String>> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right('Đăng nhập thành công');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Email không hợp lệ';
      } else if (e.code == 'user-not-found') {
        message = 'Không tìm thấy người dùng với email này';
      } else if (e.code == 'wrong-password') {
        message = 'Sai mật khẩu';
      } else {
        message = 'Đăng nhập thất bại: ${e.message}';
      }

      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      FirebaseFirestore.instance.collection('Users').add(
        {
          'name' : createUserReq.fullName,
          'email' : data.user?.email,
        }
      );
      return const Right('Đăng ký thành công');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'Mật khẩu quá yếu';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email này đã được sử dụng';
      } else if (e.code == 'invalid-email') {
        message = 'Email không hợp lệ';
      } else {
        message = 'Đăng ký thất bại: ${e.message}';
      }

      return Left(message);
    }
  }
}
