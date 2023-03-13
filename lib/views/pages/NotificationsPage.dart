// NotificationsPage.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/app_colors.dart';
import '../../controllers/notifications_controller.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NotificationsController>(
        init: NotificationsController(),
        builder: (controller) => Scaffold(
          body: Column(
            children: [
              TabBar(
                controller: controller.tabController,
                tabs: [
                  Tab(text: ('My Requests'),
                ),
                  Tab(text: 'Newsletter'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    Center(child: Text('My Requests')),
                    Center(child: Text('This is Newsletter')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
