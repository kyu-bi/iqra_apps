import 'package:flutter/material.dart';
import 'package:iqra_app/modules/detailhijaiyah/controller/detail_huruf_controller.dart';
import 'package:iqra_app/data/models/detailhijaiyah.dart' as detail;
import 'package:provider/provider.dart';

class DetailHuruf extends StatelessWidget {
  final int id;
  DetailHuruf({required this.id});

  List<Widget> harkats = [];
  List<detail.Harkat>? harkat;
  DetailHijaiyahController detailHijaiyahC = DetailHijaiyahController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Huruf"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => DetailHijaiyahController(),
        child: FutureBuilder<detail.DetailHijaiyah>(
          future: detailHijaiyahC.getDetailHijaiyah(id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text("Data Kosong"),
              );
            }

            harkats = List.generate(
              snapshot.data?.harkats.length ?? 0,
              (index) {
                harkat = snapshot.data?.harkats;
                return Consumer<DetailHijaiyahController>(
                  builder: (context, harkatState, _) {
                    if (harkatState.selectedHarkatIndex == index) {
                      return Column(
                        children: [
                          Text(
                            "${harkat?[index].tulisanArab}",
                            style: TextStyle(
                              fontSize: 50,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15)),
                            width: 80,
                            height: 50,
                            child: Center(
                              child: Text(
                                "${harkat?[index].tulisanLatin}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<DetailHijaiyahController>(
                                context,
                              ).selectHarkat(index);
                              // print(index);
                            },
                            child: Text("${harkat?[index].harkat}"),
                          ),
                        ],
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 175),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<DetailHijaiyahController>(
                                context,
                                listen: false,
                              ).selectHarkat(index);
                              // print(index);
                            },
                            child: Text("${harkat?[index].harkat}"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: harkats,
                ),
                SizedBox(height: 30),

                Text(
                  "Cara Pengucapan :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Seperti Huruf A, Mulut dibuka (Aa/Ii/Uu), Diucapkan dipangkal tenggorokan",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text("Contoh Pengucapan :"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_circle_outline_outlined),
                  iconSize: 80,
                )
                // Text("${harkat?[index].tulisanArab}"),
              ],
            );
          },
        ),
      ),
    );
  }
}
