import 'package:flutter/material.dart';
import 'package:iqra_app/modules/detailhijaiyah/controller/detailhijaiyah_controller.dart';
import 'package:iqra_app/data/models/detailhijaiyah.dart' as detail;
import 'package:provider/provider.dart';

class DetailHuruf extends StatelessWidget {
  final int id;
  DetailHuruf({required this.id});

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

            List<Widget> harkats = List.generate(
              snapshot.data?.harkats.length ?? 0,
              (index) {
                List<detail.Harkat>? harkat = snapshot.data?.harkats;
                return Consumer<DetailHijaiyahController>(
                  builder: (context, harkatState, _) {
                    // print(harkatState.selectedHarkatIndex);
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
                          Text(
                            "${harkat?[index].tulisanLatin}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      );
                    }

                    return Row(
                      children: [
                        SizedBox(height: 20),
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
                    );
                  },
                );
              },
            );

            return Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: harkats,
                  ),
                  SizedBox(height: 50),

                  // Text("${harkat?[selectedHarkatIndex].tulisanArab}"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
