import 'package:get/get.dart';

import '../../models/RequestModel.dart';

class AdminRequestsController extends GetxController {
  final myList = <RequestModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    myList.addAll([
      RequestModel(liters: 4, gift: 'Pack Nadhif', date: 'Mon, Oct 24'),
      RequestModel(liters: 14, gift: 'Pack javel', date: 'Wed, Oct 26'),
      RequestModel(liters: 7, gift: 'Pack rose...', date: 'Mon, Oct 31'),
      RequestModel(liters: 7, gift: '2 pack nadhif', date: 'Mon, Nov 04'),
    ]);
  }

}

