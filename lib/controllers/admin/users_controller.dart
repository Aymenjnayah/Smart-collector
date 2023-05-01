import 'package:get/get.dart';

import '../../models/user.dart';

class UsersController extends GetxController {
  final users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    users.assignAll([
      User(
        name: 'User name',
        email: 'Useremail@gmail.com',
        phone: '15 Pts',
        location: '75 Litres',
        avatar: 'https://via.placeholder.com/50x50.png?text=JD',
      ),
      User(
        name: 'User name',
        email: 'Useremail@gmail.com',
        phone: '15 Pts',
        location: '75 Litres',
        avatar: 'https://via.placeholder.com/50x50.png?text=JS',
      ),
      User(
        name: 'User name',
        email: 'Useremail@gmail.com',
        phone: '15 Pts',
        location: '75 Litres',
        avatar: 'https://via.placeholder.com/50x50.png?text=BJ',
      ),
    ]);
  }
}
