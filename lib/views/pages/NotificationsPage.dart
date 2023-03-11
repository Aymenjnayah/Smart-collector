// NotificationsPage.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/notifications_controller.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            Center(child: Text('This is Tab 1')),
            Center(child: Text('This is Tab 2')),
            Center(child: Text('This is Tab 3')),
          ],
        ),
      ),
    );
  }
}
