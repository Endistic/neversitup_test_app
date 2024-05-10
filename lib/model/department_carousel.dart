import 'dart:convert';

List<DepartmentCarousel> departmentCarouselFromJson(String str) => List<DepartmentCarousel>.from(json.decode(str).map((x) => DepartmentCarousel.fromJson(x)));

String departmentCarouselToJson(List<DepartmentCarousel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentCarousel {
    String name;
    String imageUrl;
    String id;

    DepartmentCarousel({
        required this.name,
        required this.imageUrl,
        required this.id,
    });

    factory DepartmentCarousel.fromJson(Map<String, dynamic> json) => DepartmentCarousel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "id": id,
    };
}
