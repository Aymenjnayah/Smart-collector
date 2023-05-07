import 'package:flutter/material.dart';
import 'package:smart_collector/config/app_styles.dart';

import '../../../widgets/NewRequestAppBar.dart';

class NewRequestPageStepThree extends StatelessWidget {
  const NewRequestPageStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustumAppBar(
              title: "Request details",
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding:const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/product.png",
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "1L gel  nettoyant Lilas + 1kg Lilas poudre",
                      style: AppStyles.neutralBlack16W7Style,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFE9F7EF),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text("Amount (L)", style: AppStyles.black14W7Style),
                        Text("5.00"),
                        Text("Address", style: AppStyles.black14W7Style),
                        Text("39 Ali belhawen street, Eljem, Mahdia"),
                        Text("Appointment", style: AppStyles.black14W7Style),
                        Text("Oct 24, 2022"),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFE9F7EF),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      "assets/images/sample_qr_code.png",
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
