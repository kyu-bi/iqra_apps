// To parse this JSON data, do
//
//     final detailHijaiyah = detailHijaiyahFromJson(jsonString);

import 'dart:convert';

DetailHijaiyah detailHijaiyahFromJson(String str) => DetailHijaiyah.fromJson(json.decode(str));

String detailHijaiyahToJson(DetailHijaiyah data) => json.encode(data.toJson());

class DetailHijaiyah {
    int id;
    String huruf;
    String tulisanLatin;
    DateTime createdAt;
    DateTime updatedAt;
    List<Harkat> harkats;

    DetailHijaiyah({
        required this.id,
        required this.huruf,
        required this.tulisanLatin,
        required this.createdAt,
        required this.updatedAt,
        required this.harkats,
    });

    factory DetailHijaiyah.fromJson(Map<String, dynamic> json) => DetailHijaiyah(
        id: json["id"],
        huruf: json["huruf"],
        tulisanLatin: json["tulisan_latin"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        harkats: List<Harkat>.from(json["harkats"].map((x) => Harkat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "huruf": huruf,
        "tulisan_latin": tulisanLatin,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "harkats": List<dynamic>.from(harkats.map((x) => x.toJson())),
    };
}

class Harkat {
    int id;
    int hurufId;
    String harkat;
    String tulisanArab;
    String tulisanLatin;
    String pengucapan;
    String audio;
    DateTime createdAt;
    DateTime updatedAt;

    Harkat({
        required this.id,
        required this.hurufId,
        required this.harkat,
        required this.tulisanArab,
        required this.tulisanLatin,
        required this.pengucapan,
        required this.audio,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Harkat.fromJson(Map<String, dynamic> json) => Harkat(
        id: json["id"],
        hurufId: json["huruf_id"],
        harkat: json["harkat"],
        tulisanArab: json["tulisan_arab"],
        tulisanLatin: json["tulisan_latin"],
        pengucapan: json["pengucapan"],
        audio: json["audio"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "huruf_id": hurufId,
        "harkat": harkat,
        "tulisan_arab": tulisanArab,
        "tulisan_latin": tulisanLatin,
        "pengucapan": pengucapan,
        "audio": audio,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
