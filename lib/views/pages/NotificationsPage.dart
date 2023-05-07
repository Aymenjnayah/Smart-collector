// NotificationsPage.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/widgets/card_notification.dart';
import 'package:smart_collector/widgets/medium_text_widget.dart';
import '../../config/app_colors.dart';
import '../../config/fonts_manager.dart';
import '../../controllers/notifications_controller.dart';

class NotificationsPage extends StatelessWidget {
  Widget deletBgItem() {
    return Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(
          right: AppMargin.wm20,
          left: AppMargin.wm20,
          top: AppMargin.hm20,
          bottom: AppMargin.hm10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.hs14),
          color: Colors.red.shade500,
        ),
        child: Icon(
          CupertinoIcons.delete_solid,
          color: AppColors.whiteHoly,
          size: AppSize.hs25 * 3,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NotificationsController>(
        init: NotificationsController(),
        builder: (controller) => Scaffold(
          body: Container(
            padding: EdgeInsets.only(
                top: AppPadding.hp10,
                right: AppPadding.wp20,
                left: AppPadding.wp20),
            child: Column(
              children: [
                TabBar(
                  controller: controller.tabController,
                  indicator: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: AppColors.primary_color,
                  ),
                  tabs: [
                    Tab(
                      child: MediumTextWidget(text: "My Requests"),
                    ),
                    Tab(
                      child: MediumTextWidget(text: "Newsletter"),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: AppSize.hs18),
                          Expanded(
                            child: ListView.separated(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: const Key("5"),
                                  onDismissed: (direction) {
                                    print(index);
                                  },
                                  background: deletBgItem(),
                                  child: CardNotification(
                                    title: "Collection Confirmation",
                                    description:
                                        "Dear user , Your request  of October 24 has been confirmed with our agent!. thank you for your collaboration",
                                    Date: "27/02/2023",
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: AppSize.hs10),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: AppSize.hs18),
                          MediumTextWidget(
                            text: "Our weekly newsletter",
                            color: AppColors.Subtitle,
                            size: FontSize.fs18,
                          ),
                          SizedBox(height: AppSize.hs18),
                          Expanded(
                            child: ListView.separated(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: const Key("2"),
                                  onDismissed: (direction) {
                                    print(index);
                                  },
                                  background: deletBgItem(),
                                  child: CardNotification(
                                    title: "Collection Confirmation",
                                    description:
                                        "Dear user , Your request  of October 24 has been confirmed with our agent!. thank you for your collaboration",
                                    Date: "27/02/2023",
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: AppSize.hs10),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
