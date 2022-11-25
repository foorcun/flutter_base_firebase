import 'package:flutter_base_firebase/app/domain/entity/user.dart';

abstract class IUserDal {
  Stream<List<User>> userList();
  addUser(User user);
  Future<void> deleteUser(User u);
}
