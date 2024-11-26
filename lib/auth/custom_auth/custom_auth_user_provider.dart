import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ToDoListAuthUser {
  ToDoListAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ToDoListAuthUser> toDoListAuthUserSubject =
    BehaviorSubject.seeded(ToDoListAuthUser(loggedIn: false));
Stream<ToDoListAuthUser> toDoListAuthUserStream() => toDoListAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
