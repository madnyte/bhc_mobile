import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileOptionsItem extends StatelessWidget {
  const ProfileOptionsItem(
      {super.key,
      required this.leading,
      required this.title,
      this.lastItem = false});

  final IconData leading;
  final String title;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    Widget isLastItem() {
      if (lastItem) {
        return Container();
      }
      return const Padding(
        padding: EdgeInsets.only(left: 30.0),
        child: Divider(),
      );
    }

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          log("tapped");
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        splashColor: Theme.of(context).colorScheme.primaryContainer,
        enableFeedback: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    leading,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.apply(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              isLastItem()
            ],
          ),
        ),
      ),
    );
  }
}
