import 'package:bhc_mobile/widgets/profile/profile_options_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileOptions extends StatefulWidget {
  const ProfileOptions({super.key});

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 300,
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileOptionsItem(
                leading: FontAwesomeIcons.building,
                title: 'Properties',
                onTap: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              ProfileOptionsItem(
                leading: FontAwesomeIcons.clockRotateLeft,
                title: 'My History',
                onTap: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              ProfileOptionsItem(
                leading: FontAwesomeIcons.fileInvoice,
                title: 'My Invoices',
                onTap: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              ProfileOptionsItem(
                leading: FontAwesomeIcons.flag,
                title: 'Reports',
                lastItem: true,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
