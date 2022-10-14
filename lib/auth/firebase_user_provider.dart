import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class InunyPagineFirebaseUser {
  InunyPagineFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

InunyPagineFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<InunyPagineFirebaseUser> inunyPagineFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<InunyPagineFirebaseUser>(
      (user) {
        currentUser = InunyPagineFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
