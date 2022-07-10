import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TodoEFFirebaseUser {
  TodoEFFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TodoEFFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TodoEFFirebaseUser> todoEFFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TodoEFFirebaseUser>((user) => currentUser = TodoEFFirebaseUser(user));
