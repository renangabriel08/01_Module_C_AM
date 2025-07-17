import 'package:c1/styles/styles.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Cores.preto,
      body: Container(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.normal,
                  color: Cores.amareloClaro,
                ),
              ),
              Divider(),
              Container(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Event',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Cores.branco,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/tickets'),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Tickets',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Cores.branco,
                          ),
                        ),
                        Container(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Cores.branco,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(height: 16),
              SizedBox(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width,
                      height: height * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/renaissance.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      width: width,
                      height: height * .25,
                      color: Cores.cinza,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              width: width * .2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold,
                                      color: Cores.branco,
                                    ),
                                  ),
                                  Text(
                                    'OCT',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Cores.branco,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(width: 16),
                            Container(
                              width: width * .6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Renaissance Exhibitio',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal,
                                      color: Cores.branco,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '9:00 AM',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Cores.branco,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Cores.branco,
                                      ),
                                      Text(
                                        '6:00 PM',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Cores.branco,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Indulge in the rich tapestry of Renaissance art',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Cores.amarelo,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Cores.amarelo,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                  Text(
                                    '+33 (0)1 23 45 67 89',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Cores.branco,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Cores.branco,
                                      decorationThickness: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/artists'),
                      child: Container(
                        height: height * .08,
                        decoration: BoxDecoration(
                          color: Cores.amarelo,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Visit Gallery',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Cores.cinza,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
