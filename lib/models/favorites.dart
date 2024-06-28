import 'package:pocketbase/pocketbase.dart';

class Favorites {
  final String id;

  final List<RecordModel>? houses;

  final String user;

  Favorites(this.houses, this.user, this.id);

  Favorites.fromRecord(RecordModel data)
      : id = data.id,
        houses = data.expand['houses'],
        user = data.data['user'];
}
