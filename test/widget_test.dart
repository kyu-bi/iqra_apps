import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iqra_app/data/models/detailhijaiyah.dart';
import 'package:iqra_app/data/models/hijaiyah.dart';

void main() async {
  Uri url = Uri.parse("https://b62b-103-154-76-105.ngrok-free.app/hijaiyah");
  var res = await http.get(url);
  // print(res.body);
  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  // print(data);
  print(data[1]);

  Hijaiyah ba = Hijaiyah.fromJson(data[6]);
  print(ba.huruf);
  print(
      "------------------------------DetailHijaiyah-----------------------------------------");

  Uri url2 =
      Uri.parse("https://b62b-103-154-76-105.ngrok-free.app/hijaiyah/${ba.id}");
  var respon = await http.get(url2);
  Map<String, dynamic> dataBa =
      (json.decode(respon.body) as Map<String, dynamic>)["data"];
  DetailHijaiyah detailBa = DetailHijaiyah.fromJson(dataBa);
  print("HARKAT");
  print(detailBa.harkats[0].harkat);
  print("TULISAN ARAB");
  print(detailBa.harkats[0].tulisanArab);
  print("TULISAN LATIN");
  print(detailBa.harkats[0].tulisanLatin);
  print("PENGUCAPAN");
  print(detailBa.harkats[0].pengucapan);
}
