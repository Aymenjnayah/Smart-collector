import 'package:flutter/material.dart';
import 'package:smart_collector/config/app_styles.dart';
import '../../../widgets/NewRequestAppBar.dart';

class AdminAddGiftPage extends StatelessWidget {
  const AdminAddGiftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustumAppBar(
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
                      hintText: "Enter gift title",
                      borderRadius: 10,
                      backgroundColor: const Color(0xffE9F7EF)),
                  SizedBox(height: 20),
                  Text("Gift Image", style: AppStyles.neutralBlack14W4Style),
                  SizedBox(height: 10),
                  _buildTextField(
                      hintText: "Enter gift image URL",
                      borderRadius: 10,
                      backgroundColor: const Color(0xffE9F7EF)),
                  SizedBox(height: 20),
                  Text("Gift Price", style: AppStyles.neutralBlack14W4Style),
                  SizedBox(height: 10),
                  _buildTextField(
                      hintText: "Enter gift price",
                      borderRadius: 10,
                      backgroundColor: const Color(0xffE9F7EF)),
                  SizedBox(height: 20),
                  Text("Gift Quantity", style: AppStyles.neutralBlack14W4Style),
                  SizedBox(height: 10),
                  _buildTextField(
                      hintText: "Enter gift quantity",
                      borderRadius: 10,
                      backgroundColor: const Color(0xffE9F7EF)),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text("Add gift", style: TextStyle(color: Colors.white)),
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
    );
  }

  Widget _buildTextField({
    required String hintText,
    required double borderRadius,
    required Color backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
