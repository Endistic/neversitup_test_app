import 'dart:convert';

List<DepartmentProduct> departmentProductFromJson(String str) => List<DepartmentProduct>.from(json.decode(str).map((x) => DepartmentProduct.fromJson(x)));

String departmentProductToJson(List<DepartmentProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentProduct {
    String name;
    String imageUrl;
    String desc;
    String price;
    Type type;
    String id;
    String departmentId;

    DepartmentProduct({
        required this.name,
        required this.imageUrl,
        required this.desc,
        required this.price,
        required this.type,
        required this.id,
        required this.departmentId,
    });

    factory DepartmentProduct.fromJson(Map<String, dynamic> json) => DepartmentProduct(
        name: json["name"],
        imageUrl: json["imageUrl"],
        desc: json["desc"],
        price: json["price"],
        type: typeValues.map[json["type"]]!,
        id: json["id"],
        departmentId: json["departmentId"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "desc": desc,
        "price": price,
        "type": typeValues.reverse[type],
        "id": id,
        "departmentId": departmentId,
    };
}

enum Type {
    NORMAL,
    SPACIAL
}

final typeValues = EnumValues({
    "normal": Type.NORMAL,
    "spacial": Type.SPACIAL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}