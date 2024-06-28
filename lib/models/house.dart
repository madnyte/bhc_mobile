import 'package:bhc_mobile/utils/constants.dart';
import 'package:bhc_mobile/utils/utils.dart';
import 'package:pocketbase/pocketbase.dart';

class House {
  final String id;

  final String title;

  final String type;

  final String thumbnail;

  final List<String> images;

  final int no_of_rooms;

  final int no_of_bathrooms;

  final int price;

  final String description;

  final String tags;

  final String location;

  final String payment_method;

  House(
      this.id,
      this.title,
      this.type,
      this.thumbnail,
      this.images,
      this.no_of_rooms,
      this.no_of_bathrooms,
      this.price,
      this.description,
      this.tags,
      this.location,
      this.payment_method);

  House.fromRecord(RecordModel data)
      : id = data.id,
        title = data.data['title'],
        type = data.data['type'],
        thumbnail = data.resolveFileUrl('thumbnail'),
        images = data.resolveImageUrls(),
        no_of_rooms = data.data['no_of_rooms'],
        no_of_bathrooms = data.data['no_of_bathrooms'],
        price = data.data['price'],
        description = data.data['description'],
        tags = data.data['tags'],
        location = data.data['location'],
        payment_method = data.data['payment_method'];
}
