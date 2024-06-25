import 'package:bhc_mobile/widgets/profile/profile_options_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileOptionsAlt extends StatelessWidget {
  const ProfileOptionsAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(100, 100, 111, 0.2),
              blurRadius: 29,
              spreadRadius: 0,
              offset: Offset(
                0,
                7,
              ),
            ),
          ],
          color: Colors.white,
        ),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileOptionsItem(
                leading: FontAwesomeIcons.userPen,
                title: 'Edit Profile',
              ),
              SizedBox(
                height: 10.0,
              ),
              ProfileOptionsItem(
                leading: FontAwesomeIcons.arrowRightFromBracket,
                title: 'Log Out',
                lastItem: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
