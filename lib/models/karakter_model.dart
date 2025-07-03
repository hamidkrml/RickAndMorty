import 'dart:convert';

class KarakterModelSonuc {
  final KarakterModel info;
  final List<KarakterInfo> karakter;

  KarakterModelSonuc({required this.info, required this.karakter});

  factory KarakterModelSonuc.fromJson(Map<String, dynamic> json) {
    final info = KarakterModel.fromJson(json['info']);
    final karakter = (json['results'] as List)
        .map((karakterjson) => KarakterInfo.fromJson(karakterjson))
        .toList();
    return KarakterModelSonuc(info: info, karakter: karakter);
  }
}

///
class KarakterModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  // KarakterModel sınıfı, karakterlerin toplam sayısı, sayfa sayısı ve bir sonraki/önceki sayfanın linkini tutar.
  KarakterModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  /// JSON verisinden KarakterModel nesnesi oluşturur.
  KarakterModel.fromJson(Map<String, dynamic> json)
    : count = json['count'],
      pages = json['pages'],
      next = json['next'],
      prev = json['prev'];
}

class KarakterInfo {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final Location location;
  final List<String> episode;
  final Origin origin;

  // KarakterInfo sınıfı, bir karakterin tüm temel bilgilerini (id, isim, durum, tür, cinsiyet, resim, konum ve bölüm listesi) tutar.
  KarakterInfo({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.location,
    required this.origin,
    required this.episode,
  });

  /// JSON verisinden KarakterInfo nesnesi oluşturur.
  KarakterInfo.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      status = json['status'],
      species = json['species'],
      gender = json['gender'],
      image = json['image'],
      origin = Origin.fromJson(json['origin']),
      location = Location.fromJson(json['location']),
      episode = List<String>.from(json['episode']);
}

class Location {
  final String name;
  final String url;

  // Location sınıfı, karakterin bulunduğu konumun adını ve URL'sini tutar.
  Location({required this.name, required this.url});

  /// JSON verisinden Location nesnesi oluşturur.
  Location.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      url = json['url'];
}

class Origin {
  final String name;
  final String url;

  // Location sınıfı, karakterin bulunduğu konumun adını ve URL'sini tutar.
  Origin({required this.name, required this.url});

  /// JSON verisinden Location nesnesi oluşturur.
  Origin.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      url = json['url'];
}
