import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/app_styles.dart';
import '../../../controllers/admin/admin_add_gift_controller.dart';
import '../../../widgets/NewRequestAppBar.dart';

class AdminAddGiftPage extends StatelessWidget {
  final AdminAddGiftController _controller = Get.put(AdminAddGiftController());

   AdminAddGiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: "Gifts",
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gift Title", style: AppStyles.neutralBlack14W4Style),
                    SizedBox(height: 10),
                    _buildTextField(
                        controller: _controller.giftTitleController,
                        hintText: "Enter gift title",
                        borderRadius: 10,
                        backgroundColor: const Color(0xffE9F7EF)),
                    SizedBox(height: 20),
                    Text("Gift Image", style: AppStyles.neutralBlack14W4Style),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                              controller: _controller.giftImageController,
                              hintText: "Enter gift image URL",
                              borderRadius: 10,
                              backgroundColor: const Color(0xffE9F7EF)),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () async {
                            await _controller.pickImage();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text("Pick image",
                                style: TextStyle(color: Colors.white)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("Gift Price", style: AppStyles.neutralBlack14W4Style),
                    SizedBox(height: 10),
                    _buildTextField(
                        controller: _controller.giftPriceController,
                        hintText: "Enter gift price",
                        borderRadius: 10,
                        backgroundColor: const Color(0xffE9F7EF)),
                    SizedBox(height: 20),
                    Text("Gift Quantity", style: AppStyles.neutralBlack14W4Style),
                    SizedBox(height: 10),
                    _buildTextField(
                        controller: _controller.giftQuantityController,
                        hintText: "Enter gift quantity",
                        borderRadius: 10,
                        backgroundColor: const Color(0xffE9F7EF)),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {_controller.addGift();},
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text("Add gift",
                              style: TextStyle(color: Colors.white)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildTextField({
    required String hintText,
    required double borderRadius,
    required Color backgroundColor,
    required TextEditingController controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        controller: controller, // set the controller for the TextField
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }

}
