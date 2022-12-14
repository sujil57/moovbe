import 'dart:convert';


class LocalData {
  LocalData({
    this.name,
  });

  dynamic name;

  factory LocalData.fromRawJson(String str) =>
      LocalData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocalData.fromJson(Map<String, dynamic> json) => LocalData(
        name: json["name"] == false ? '' : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };

  factory LocalData.fromLocalJson(Map<String, dynamic> json) => LocalData(
        name: json["name"],
      );

  LocalData.copyValues(LocalData pdt) {
    name = pdt.name;
  }
}




























// class LocalData {
//   LocalData({
//     this.name,
//   });

//   dynamic name;

//   factory LocalData.fromRawJson(String str) =>
//       LocalData.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory LocalData.fromJson(Map<String, dynamic> json) => LocalData(
//         name: json["name"] == false ? '' : json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name == null ? null : name,
//       };

//   factory LocalData.fromLocalJson(Map<String, dynamic> json) => LocalData(
//         name: json["name"],
//       );

//   LocalData.copyValues(LocalData pdt) {
//     name = pdt.name;
//   }
// }
