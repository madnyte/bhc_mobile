import 'package:bhc_mobile/utils/utils.dart';
import 'package:pocketbase/pocketbase.dart';

class Profile {
  final String id;

  final String avatarUrl;

  final String name;

  final String username;

  final String email;

  Profile(this.name, this.email, this.avatarUrl, this.id, this.username);

  Profile.fromRecord(RecordModel data)
      : id = data.id,
        avatarUrl = data.resolveFileUrl('avatar'),
        name = data.data['name'],
        username = data.data['username'],
        email = data.data['email'];
}
