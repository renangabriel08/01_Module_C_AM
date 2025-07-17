import 'package:c1/styles/styles.dart';
import 'package:flutter/material.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  List<Map> artistas = [
    {
      'img': 'assets/images/leonardo_da_vinci/leonardo_da_vinci.jpeg',
      'nome': 'Leonardo da Vinci',
      'data': '1452 - 1519',
      'artes': <Map>[
        {
          'img': 'assets/images/leonardo_da_vinci/mona_lisa.jpg',
          'topLeft': 999,
          'bottomLeft': 999,
          'bottomRight': 999,
          'topRight': 999,
        },
        {
          'img': 'assets/images/leonardo_da_vinci/lady_ermine.jpg',
          'topLeft': 0,
          'bottomLeft': 999,
          'bottomRight': 999,
          'topRight': 0,
        },
        {
          'img': 'assets/images/leonardo_da_vinci/litta_madonna.jpg',
          'topLeft': 0,
          'bottomLeft': 0,
          'bottomRight': 0,
          'topRight': 0,
        },
      ],
    },

    {
      'img': 'assets/images/michelangelo/michelangelo.jpg',
      'nome': 'Michelangelo',
      'data': '1475 - 1564',
      'artes': <Map>[
        {
          'img': 'assets/images/michelangelo/david.jpg',
          'topLeft': 0,
          'bottomLeft': 999,
          'bottomRight': 999,
          'topRight': 0,
        },
        {
          'img': 'assets/images/michelangelo/torment_of_saint_anthony.jpg',
          'topLeft': 999,
          'bottomLeft': 999,
          'bottomRight': 999,
          'topRight': 999,
        },
        {
          'img': 'assets/images/michelangelo/delphic_sibyl.jpg',
          'topLeft': 999,
          'bottomLeft': 0,
          'bottomRight': 0,
          'topRight': 999,
        },
      ],
    },

    {
      'img': 'assets/images/gustav_klimt/gustav_klimt.jpg',
      'nome': 'Gustav Klimt',
      'data': '1862 - 1918',
      'artes': <Map>[
        {
          'img': 'assets/images/gustav_klimt/the_kiss.jpg',
          'topLeft': 999,
          'bottomLeft': 0,
          'bottomRight': 0,
          'topRight': 999,
        },
        {
          'img': 'assets/images/gustav_klimt/adele_bloch_bauer.jpg',
          'topLeft': 0,
          'bottomLeft': 0,
          'bottomRight': 0,
          'topRight': 0,
        },
        {
          'img': 'assets/images/gustav_klimt/lady_with_fan.jpg',
          'topLeft': 999,
          'bottomLeft': 999,
          'bottomRight': 999,
          'topRight': 999,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,

        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore the art of',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.normal,
                          color: Cores.preto,
                        ),
                      ),
                      Text(
                        'Renaissance',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.normal,
                          color: Cores.amarelo,
                        ),
                      ),
                      Container(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Type to search...',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.fullscreen),
                        ),
                      ),
                      Container(height: 16),
                      SizedBox(
                        width: width,
                        height: 40,
                        child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            indicatorColor: Cores.amarelo,
                            labelColor: Cores.amarelo,
                            dividerColor: Cores.cinza,
                            dividerHeight: 1.5,
                            labelStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'PlayfairDisplay',
                            ),
                            tabs: [
                              SizedBox(
                                width: width * .22,
                                child: Tab(text: 'Artists'),
                              ),
                              SizedBox(
                                width: width * .22,
                                child: Tab(text: 'Artwork'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(height: 16),
                      for (var artista in artistas)
                        Column(
                          children: [
                            if (artista['nome'] == 'Michelangelo')
                              ListTile(
                                isThreeLine: true,
                                trailing: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      999,
                                    ),
                                    child: Image.asset(
                                      artista['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  artista['nome'],
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Cores.preto,
                                  ),
                                ),
                                subtitle: Text(
                                  artista['data'],
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            else
                              ListTile(
                                isThreeLine: true,
                                leading: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      999,
                                    ),
                                    child: Image.asset(
                                      artista['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  artista['nome'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Cores.preto,
                                  ),
                                ),
                                subtitle: Text(
                                  artista['data'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            SingleChildScrollView(
                              reverse: artista['nome'] == 'Michelangelo',
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var arte in artista['artes'])
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(
                                          context,
                                          '/exposition',
                                        ),
                                        child: Container(
                                          width: 150,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                arte['bottomLeft'].toDouble(),
                                              ),
                                              bottomRight: Radius.circular(
                                                arte['bottomRight'].toDouble(),
                                              ),
                                              topLeft: Radius.circular(
                                                arte['topLeft'].toDouble(),
                                              ),
                                              topRight: Radius.circular(
                                                arte['topRight'].toDouble(),
                                              ),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                arte['bottomLeft'].toDouble(),
                                              ),
                                              bottomRight: Radius.circular(
                                                arte['bottomRight'].toDouble(),
                                              ),
                                              topLeft: Radius.circular(
                                                arte['topLeft'].toDouble(),
                                              ),
                                              topRight: Radius.circular(
                                                arte['topRight'].toDouble(),
                                              ),
                                            ),
                                            child: Image.asset(
                                              arte['img'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(height: 16),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
