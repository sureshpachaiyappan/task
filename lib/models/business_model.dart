import 'dart:convert';
import 'dart:typed_data';

class BusinessesList {
  BusinessesList({
    required this.businesses,
    required this.total,
    //required this.region,
  });
  late final List<Businesses> businesses;
  late final int total;
  //late final Region region;

  BusinessesList.fromJson(Map<String, dynamic> json) {
    //businesses = List.from(json['businesses']).map((e)=>Businesses.fromJson(e)).toList();
    if (json['businesses'] != null) {
      businesses = <Businesses>[];
      for (final dynamic v in json['businesses'] as List<dynamic>) {
        businesses!.add(Businesses.fromJson(v as Map<String, dynamic>));
      }
    }
    total = json['total'];
    //region = Region.fromJson(json['region']);
  }
}

class Businesses {
  Businesses({
    required this.id,
    required this.alias,
    this.name,
    this.imageUrl,
    required this.isClosed,
    this.url,
    required this.reviewCount,
    required this.categories,
    required this.rating,
    required this.coordinates,
    this.price,
    required this.location,
    this.phone,
    this.displayPhone,
     this.distance,
  });
  late final String id;
  String? alias;
  String? name;
  String? imageUrl;
  late final bool isClosed;
  String? url;
  late final int reviewCount;
  late final List<Categories> categories;
  late final double rating;
  late final Coordinates coordinates;
  String? price;
  late final Location location;
  String? phone;
  String? displayPhone;
  double? distance;

  Businesses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    name = json['name'];
    imageUrl = json['image_url'];
    isClosed = json['is_closed'];
    url = json['url'];
    reviewCount = json['review_count'];
    categories = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
    rating = json['rating'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    price = json['price'];
    location = Location.fromJson(json['location']);
    phone = json['phone'];
    displayPhone = json['display_phone'];
    distance = json['distance'];
  }
}

class Categories {
  Categories({
    required this.alias,
    required this.title,
  });
  late final String alias;
  late final String title;

  Categories.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['alias'] = alias;
    _data['title'] = title;
    return _data;
  }
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });
  late final double latitude;
  late final double longitude;

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}

class Location {
  Location({
    required this.address1,
    this.address2,
    this.address3,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.displayAddress,
  });
  late final String address1;
  late final String? address2;
  late final String? address3;
  late final String city;
  late final String zipCode;
  late final String country;
  late final String state;
  late final List<String> displayAddress;

  Location.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'];
    address2 = null;
    address3 = null;
    city = json['city'];
    zipCode = json['zip_code'];
    country = json['country'];
    state = json['state'];
    displayAddress = List.castFrom<dynamic, String>(json['display_address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address1'] = address1;
    _data['address2'] = address2;
    _data['address3'] = address3;
    _data['city'] = city;
    _data['zip_code'] = zipCode;
    _data['country'] = country;
    _data['state'] = state;
    _data['display_address'] = displayAddress;
    return _data;
  }
}

// class Region {
//   Region({
//     required this.center,
//   });
//   late final Center center;
//
//   Region.fromJson(Map<String, dynamic> json) {
//     center = Center.fromJson(json['center']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['center'] = center.toJson();
//     return _data;
//   }
// }

// class Center {
//   Center({
//     required this.longitude,
//     required this.latitude,
//   });
//   late final double longitude;
//   late final double latitude;
//
//   Center.fromJson(Map<String, dynamic> json) {
//     longitude = json['longitude'];
//     latitude = json['latitude'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['longitude'] = longitude;
//     _data['latitude'] = latitude;
//     return _data;
//   }
// }
