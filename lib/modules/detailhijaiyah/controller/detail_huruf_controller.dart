import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iqra_app/data/models/detailhijaiyah.dart';
import 'dart:convert';
import 'package:iqra_app/data/models/detailhijaiyah.dart' as detail;

class DetailHijaiyahController extends ChangeNotifier {
  int selectedHarkatIndex = 0;
  void selectHarkat(int index) {
    selectedHarkatIndex = index;
    notifyListeners();
  }

  List<detail.Harkat>? _harkat;

  List<detail.Harkat>? get harkat => _harkat;

  void setHarkat(List<detail.Harkat>? newHarkat) {
    _harkat = newHarkat;
    notifyListeners();
  }

  Future<DetailHijaiyah> getDetailHijaiyah(String id) async {
    Uri url =
        Uri.parse("https://0960-103-154-76-105.ngrok-free.app/hijaiyah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];
    return DetailHijaiyah.fromJson(data);
  }
}
