import 'package:get/get.dart';
import 'package:smart_collector/routes/app_routes.dart';
import '../../models/Item.dart';

class AdminCollectionsController extends GetxController {
  final items = <Item>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("NewRequestStepTwoController");
    // Sample data
    items.addAll([
      Item(
          imageUrl: 'https://via.placeholder.com/150',
          title: '1L gel  nettoyant Lilas + 1kg Lilas poudre',
          price: 10.99,
          description : 'Every 5L used cooking oil = 1 pack'
      ),
      Item(
          imageUrl: 'https://via.placeholder.com/150',
          title: '1L gel  nettoyant Lilas + 1kg Lilas poudre',
          price: 5.99,
          description : 'Every 5L used cooking oil = 1 pack'
      ),
      Item(
          imageUrl: 'https://via.placeholder.com/150',
          title: '1L gel  nettoyant Lilas + 1kg Lilas poudre',
          price: 7.49,
          description : 'Every 5L used cooking oil = 1 pack'
      ),
    ]);
  }

  goToAddGift() {
    Get.toNamed(AppRoutes.adminAddGift);
  }
}
