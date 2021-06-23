import 'package:flutter/material.dart';
import 'package:todey/utils/theme.dart';

class SettingTile extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  final IconData icon;

  const SettingTile({Key key, this.btnText, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Mediaquery to get responsiveness
    var height = MediaQuery.of(context).size.height;

    //theme
    var theme = Theme.of(context);
    //date time button will be from the boat ui
    return Container(
        height: height * 0.07,
        child: Center(
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.white,
            ),
            title: Text(
              btnText,
              style: styleText(),
            ),
          ),
        ));
  }

  styleText() {
    return TextStyle(
      color: settingColor,
    );
  }
}