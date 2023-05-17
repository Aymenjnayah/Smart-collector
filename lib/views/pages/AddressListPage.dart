import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/AddressListController.dart';
import 'package:smart_collector/widgets/AddressCard.dart';

class AddressListPage extends StatelessWidget {
  final AddressListController controller = Get.put(AddressListController());

  AddressListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Your location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(padding:
              EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Saved locations",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.goToAddAddress();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                    () => Expanded(
                  child: ListView.builder(
                    itemCount: controller.addressList.length,
                    itemBuilder: (context, index) {
                      return AddressCard(
                        city: "${controller.addressList[index].city}L",
                        town: controller.addressList[index].town.toString(),
                        street:
                        controller.addressList[index].address.toString(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
