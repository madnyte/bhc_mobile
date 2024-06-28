import 'dart:developer';

import 'package:bhc_mobile/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

final auth = PocketBase('https://bhc-backend-damp-forest-976.fly.dev/');

class Auth {
  static Future<bool> isLoggedIn(BuildContext context) async {
    return auth.authStore.isValid;
  }

  static Future<Profile?> getUser(BuildContext context) async {
    log('called');
    try {
      final isLoggedIn = auth.authStore.isValid;
      if (isLoggedIn) {
        return auth.authStore.model;
      }
      return null;
    } catch (err) {
      return null;
    }
  }

  static const lastUserPrefsKey = 'last_user';
  static const accessTokenPrefsKey = 'access_token';
  static const accessModelPrefsKey = 'access_model';
  static const accessNamePrefsKey = 'access_name';
}
