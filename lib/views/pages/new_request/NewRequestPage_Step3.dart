import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_collector/controllers/NewRequestStepThree_controller.dart';
import 'package:smart_collector/routes/app_routes.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';

import '../../../config/app_styles.dart';
import '../../../widgets/NewRequestAppBar.dart';

class NewRequestPageStepThree extends StatelessWidget {
  final controller = Get.put(NewRequestStepThreeController());

  NewRequestPageStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustumAppBar(
                title: "Request details",
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Column(
                      children: controller.items.value.map((item) => Column(
                        children: [
                          Image.network(
                            item.imageUrl,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              item.title,
                              style: AppStyles.neutralBlack16W7Style,
                            ),
                          ),
                        ],
                      )).toList(),
                    )),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                            () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text("Amount (L)", style: AppStyles.black14W7Style),
                            Text(controller.request.value.amount.toString()),
                            Text("Address", style: AppStyles.black14W7Style),
                            Text(controller.request.value.address.toString()),
                            Text("Appointment", style: AppStyles.black14W7Style),
                            Text(controller.request.value.date.toString()),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFE9F7EF),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: QrImageView(
                        data: controller.request.value.docId.toString(),
                        version: QrVersions.auto,
                        size: 150,
                        gapless: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: SubmitButton(buttonText: "Go Home",onPressed: ()=>{
                        Get.offAllNamed(AppRoutes.dashboard)
                      }),
                    ),
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
