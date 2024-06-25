import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:settings_ui/settings_ui.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(
              'Account Settings',
              style: Theme.of(context).textTheme.headlineSmall?.apply(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.person),
                title: Text(
                  'Personal Information',
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color: Colors.black,
                      ),
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.lock),
                title: Text(
                  'Password & Security',
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color: Colors.black,
                      ),
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.notifications),
                title: Text(
                  'Notifications',
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color: Colors.black,
                      ),
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SettingsSection(
            title: Text(
              'Other',
              style: Theme.of(context).textTheme.headlineSmall?.apply(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(MdiIcons.chatQuestionOutline),
                title: Text(
                  'FAQ',
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color: Colors.black,
                      ),
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
              SettingsTile.navigation(
                leading: Icon(MdiIcons.helpCircleOutline),
                title: Text(
                  'Help Center',
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color: Colors.black,
                      ),
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
