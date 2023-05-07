import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/app_styles.dart';
import 'package:smart_collector/controllers/admin/admin_collections_controller.dart';

import '../../../widgets/NewRequestAppBar.dart';
import '../../../widgets/gift_item.dart';

class AdminCollectionsPage extends StatelessWidget {
  const AdminCollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminCollectionsController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustumAppBar(
              title: "Gifts",
            ),
            SizedBox(height: 20,),
            Padding(
              padding:const  EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gifts List",style: AppStyles.black18W6Style,),
                  GestureDetector(
                    onTap: ()=>{ controller.goToAddGift()},
                    child: Image.asset(
                      "assets/images/add_icon.png",
                      width: 40,
                      height: 40,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return GiftItem(
                      item: item,
                      showNumberPicker: false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
