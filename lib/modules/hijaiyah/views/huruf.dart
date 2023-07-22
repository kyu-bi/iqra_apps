import 'package:flutter/material.dart';
import 'package:iqra_app/constant/font_color.dart';

import 'package:iqra_app/modules/detailhijaiyah/views/detail_huruf.dart';
import 'package:iqra_app/data/models/hijaiyah.dart';
import 'package:iqra_app/modules/hijaiyah/controllers/huruf_controller.dart';

class HurufHijaiyah extends StatelessWidget {
  HijaiyahController hijaiyahC = HijaiyahController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IQRA' KU"),
        titleTextStyle: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w900, fontFamily: "Beachday"),
        backgroundColor: bluegrey,
      ),
      backgroundColor: Color(0xffF0F0F0),
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            width: 360,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Color(0xff538299), Color(0xffa7c4d2)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 9.5,
                )
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        "assets/img/huruf2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 60),
                Positioned(
                  bottom: -20,
                  right: -10,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        "assets/img/huruf3.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'HURUF HIJAIYAH',
                        style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Color.fromARGB(255, 3, 103, 142),
                          fontFamily: "beachday",
                        ),
                      ),
                      Text(
                        'HURUF HIJAIYAH',
                        style: TextStyle(
                          fontFamily: "beachday",
                          fontSize: 40,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 9.5,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 20),
                child: FutureBuilder<List<Hijaiyah>>(
                    future: hijaiyahC.getAllItem(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      //jika tidak punya data
                      if (!snapshot.hasData) {
                        return Center(child: Text("Tidak Ada Data"));
                      }

                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: GridView.builder(
                            itemCount: snapshot.data!.length,
                            shrinkWrap: false,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              childAspectRatio: 1 / 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              Hijaiyah hijaiyah = snapshot.data![index];
                              return InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailHuruf(id: hijaiyah.id),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    //  ha = snapshot.data,
                                    Container(
                                      width: 300,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/huruf1.png"),
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${hijaiyah.huruf}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${hijaiyah.tulisanLatin}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
