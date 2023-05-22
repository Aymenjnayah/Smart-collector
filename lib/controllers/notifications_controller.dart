// my_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }


//  get list notifications from collections notifications when userId equals to current user it
}
