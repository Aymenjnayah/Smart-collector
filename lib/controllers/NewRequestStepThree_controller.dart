import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/Gift.dart';
import '../models/Request.dart';

class NewRequestStepThreeController extends GetxController {
  final request = Request().obs;
  final items = <Gift>[].obs;

  @override
  void onInit() {
    super.onInit();
    request.value = Get.arguments as Request;
    fetchGifts();
  }

  @override
  void onReady() {
    super.onReady();
    fetchGifts();
  }

  Future<void> fetchGifts() async {
    final List<String> giftIds = request.value.gifts.map((gift) => gift['id'] as String).toList();

    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('gifts')
          .where(FieldPath.documentId, whereIn: giftIds)
          .get();

      final List<Gift> fetchedGifts = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>; // Explicitly cast data to Map<String, dynamic>
        return Gift.fromJson(data); // Assuming Gift.fromJson is your factory method
      }).toList();

      items.value = fetchedGifts;
    } catch (e) {
      print('Error fetching gifts: $e');
    }
  }

}
