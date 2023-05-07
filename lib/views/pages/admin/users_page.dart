import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/admin/users_controller.dart';
import '../../../widgets/NewRequestAppBar.dart';

class UsersPage extends StatelessWidget {

  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UsersController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustumAppBar(
              title: "Users",
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (value) {
                  UsersController controller = Get.find();
                  controller.setSearchText(value);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF2F2F2),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 1, thickness: 1, color: Colors.green),
            Expanded(
              child: Obx(() {
                final filteredUsers = controller.filteredUsers;
                return ListView.separated(
                  itemCount: filteredUsers.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 1,
                      color: Colors.green,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final user = filteredUsers[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          foregroundColor: Colors.green,
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user.email,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/money_icon.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(width: 4),
                                      Text(user.points.toString()),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/request_icon.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(width: 4),
                                      Text(user.liters.toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            )
            ,

          ],
        ),
      ),
    );
  }
}
