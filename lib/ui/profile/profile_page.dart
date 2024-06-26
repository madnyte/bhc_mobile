import 'dart:developer';

import 'package:bhc_mobile/models/profile.dart';
import 'package:bhc_mobile/services/authentication/auth.dart';
import 'package:bhc_mobile/widgets/profile/profile_options.dart';
import 'package:bhc_mobile/widgets/profile/profile_options_alt.dart';
import 'package:bhc_mobile/widgets/profile/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final isLoggedIn = auth.authStore.isValid;
  final user = Profile.fromRecord(auth.authStore.model as RecordModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Profile',
              style: Theme.of(context).textTheme.headlineLarge?.apply(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            UserAvatar(
              imagePath: user.avatarUrl,
              name: user.name,
              userType: 'Individual',
            ),
            const SizedBox(
              height: 50,
            ),
            ProfileOptionsAlt(),
            const SizedBox(
              height: 20.0,
            ),
            ProfileOptions()
          ],
        ),
      ),
    );
  }
}
