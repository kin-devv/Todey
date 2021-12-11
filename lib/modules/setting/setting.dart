import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:todey/modules/setting/widget/setting_title.dart';
import 'package:todey/utils/constant.dart';

//TODO cupertino switch
//TODO light_mode_rounded and dark mode rounded
//TODO dark mode test

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Padding buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: ConstanceData.abelFont,
          fontSize: 16.sp,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings".tr,
          style: theme.textTheme.headline2,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
      ),
      backgroundColor: theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('General'.tr),
              SettingTile(
                icon: Icons.light_mode_rounded,
                btnText: "Theme".tr,
                trailing: Text(""),
                onPressed: () {
                  //
                },
              ),
              SettingTile(
                icon: Entypo.language,
                btnText: "language".tr,
                trailing: Text("English"),
                onPressed: () {
                  //
                },
              ),
              buildTitle("Notification".tr),
              SettingTile(
                icon: Entypo.notification,
                btnText: "Nofitcation".tr,
                //   trailing: KSwitch(),
              ),
              SettingTile(
                icon: Entypo.notifications_off,
                btnText: "daily_reminder".tr,
                //   trailing: KSwitch(),
              ),
              buildTitle("help_feed".tr),
              SettingTile(
                icon: AntDesign.search1,
                btnText: "suggest".tr,
                trailing: Text(""),
                onPressed: () {
                  //
                  //   settingController.launchGmail();
                },
              ),
              SettingTile(
                icon: MaterialCommunityIcons.hazard_lights,
                btnText: "report".tr,
                trailing: Text(""),
                onPressed: () {
                  //
                  // settingController.reportProblem();
                },
              ),
              //
              SettingTile(
                icon: Entypo.twitter,
                btnText: "follow twitt".tr,
                trailing: Text(""),
                onPressed: () {
                  // settingController.launchTwitter();
                },
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ),
      ),
    );
  }
}