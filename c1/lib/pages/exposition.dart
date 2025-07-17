import 'dart:convert';
import 'package:c1/styles/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exposition extends StatefulWidget {
  const Exposition({super.key});

  @override
  State<Exposition> createState() => _ExpositionState();
}

class _ExpositionState extends State<Exposition> {
  List artes = [];
  List dataArtes = [
    {
      'img': 'assets/images/leonardo_da_vinci/mona_lisa.jpg',
      'topLeft': 0,
      'bottomLeft': 999,
      'bottomRight': 999,
      'topRight': 0,
    },
    {
      'img': 'assets/images/leonardo_da_vinci/lady_ermine.jpg',
      'topLeft': 999,
      'bottomLeft': 0,
      'bottomRight': 0,
      'topRight': 999,
    },
    {
      'img': 'assets/images/leonardo_da_vinci/litta_madonna.jpg',
      'topLeft': 0,
      'bottomLeft': 999,
      'bottomRight': 999,
      'topRight': 0,
    },
  ];

  startApp() async {
    String json = await rootBundle.loadString('assets/data/artworks.json');
    artes = jsonDecode(json);

    setState(() {});
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Cores.preto,
      body: artes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SizedBox(
              width: width,
              height: height,
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      for (int i = 0; i < 3; i++)
                        SizedBox(
                          width: width * .8,
                          height: height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: height * .7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                      dataArtes[i]['bottomLeft'].toDouble(),
                                    ),
                                    bottomRight: Radius.circular(
                                      dataArtes[i]['bottomRight'].toDouble(),
                                    ),
                                    topLeft: Radius.circular(
                                      dataArtes[i]['topLeft'].toDouble(),
                                    ),
                                    topRight: Radius.circular(
                                      dataArtes[i]['topRight'].toDouble(),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    if (i != 1)
                                      Container(
                                        width: width,
                                        height: height * .1,
                                        color: Cores.amarelo,
                                        child: Center(
                                          child: ListTile(
                                            title: Text(artes[i]['title']),
                                            subtitle: Text(
                                              '${artes[i]['years']}, ${artes[i]['born_at']}',
                                            ),
                                            trailing: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Cores.preto,
                                                borderRadius:
                                                    BorderRadius.circular(999),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_outward_rounded,
                                                  color: Cores.branco,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      width: width,
                                      height: height * .5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                            dataArtes[i]['bottomLeft']
                                                .toDouble(),
                                          ),
                                          bottomRight: Radius.circular(
                                            dataArtes[i]['bottomRight']
                                                .toDouble(),
                                          ),
                                          topLeft: Radius.circular(
                                            dataArtes[i]['topLeft'].toDouble(),
                                          ),
                                          topRight: Radius.circular(
                                            dataArtes[i]['topRight'].toDouble(),
                                          ),
                                        ),
                                        child: Image.asset(
                                          dataArtes[i]['img'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    if (i == 1)
                                      Container(
                                        width: width,
                                        height: height * .1,
                                        color: Cores.amarelo,
                                        child: Center(
                                          child: ListTile(
                                            title: Text(artes[i]['title']),
                                            subtitle: Text(
                                              '${artes[i]['years']}, ${artes[i]['born_at']}',
                                            ),
                                            trailing: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Cores.preto,
                                                borderRadius:
                                                    BorderRadius.circular(999),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_outward_rounded,
                                                  color: Cores.branco,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width,
                                height: height * .1,
                                child: Stack(
                                  children: [
                                    Opacity(
                                      opacity: .3,
                                      child: Image.asset(
                                        'assets/images/quote.png',
                                        height: 80,
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(30, 50),
                                      child: Text(
                                        artes[i]['comment'],
                                        style: TextStyle(color: Cores.branco),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                    options: CarouselOptions(
                      height: height,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
