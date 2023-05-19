import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/values_manager.dart';
import '../../routes/app_routes.dart';
import '../../widgets/medium_text_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pushNotificationsEnabled = true;
  bool _emailNotificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.wp20, 
                  vertical: AppSize.hs20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: IconButton(
                        onPressed:() {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.chevron_left,
                          size: 30.0,
                          color: Color.fromARGB(255, 81, 78, 78),
                        ),
                      ),
                    ),
                    MediumTextWidget(
                      text: "Settings",
                      color: AppColors.Subtitle,
                      size: FontSize.fs18,
                    ),
                    SizedBox(width: 35),
                  ],
                ),
              ),
              SizedBox(height: AppSize.hs14),
              SwitchListTile(
                title: Text("Push notifications"),
                subtitle: Text("Receive push notifications"),
                value: _pushNotificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _pushNotificationsEnabled = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Email notifications"),
                subtitle: Text("Receive email notifications"),
                value: _emailNotificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _emailNotificationsEnabled = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Dark mode"),
                subtitle: Text("Use dark mode"),
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
              ListTile(
                title: Text("Language"),
                subtitle: Text("English"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Navigate to language selection page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
