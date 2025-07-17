import 'package:c1/styles/styles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation? bottom;

  AnimationController? controller2;
  Animation? height2;

  String titulo = 'Experience Art';
  String desc =
      'We are thrilled to invite you to join us for an extraordinary event that will immerse you in the world of art.';

  List caracsTitulo = [];
  List caracsDesc = [];

  animarTextos() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
      );
      height2 = Tween<double>(
        begin: MediaQuery.of(context).size.height * .62,
        end: MediaQuery.of(context).size.height * .135,
      ).animate(CurvedAnimation(parent: controller2!, curve: Curves.linear));

      controller2!.addListener(() => setState(() {}));
      controller2!.forward();

      await Future.delayed(const Duration(milliseconds: 3500));

      for (int i = 0; i < titulo.length; i++) {
        caracsTitulo.add(titulo[i]);
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 50));
      }

      for (int i = 0; i < desc.length; i++) {
        caracsDesc.add(desc[i]);
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 50));
      }

      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );
      bottom = Tween<double>(
        begin: -60,
        end: 144,
      ).animate(CurvedAnimation(parent: controller!, curve: Curves.linear));

      controller!.addListener(() => setState(() {}));
      controller!.forward();
    });
  }

  @override
  void initState() {
    animarTextos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Cores.preto,
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height * .7,
                child: Stack(
                  children: [
                    SizedBox(
                      width: width,
                      height: height * .7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png', height: 80),
                          Container(height: 20),
                          Container(
                            width: width * .8,
                            height: height * .55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Cores.amarelo,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(999),
                                topRight: Radius.circular(999),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(999),
                                  topRight: Radius.circular(999),
                                ),
                                child: Image.asset(
                                  'assets/images/louvre.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        width: width,
                        height: height2 != null
                            ? height2!.value
                            : MediaQuery.of(context).size.height * .62,
                        decoration: BoxDecoration(
                          color: Cores.preto,
                          boxShadow: [
                            BoxShadow(
                              color: Cores.preto,
                              blurRadius: 100,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 310,
                child: SizedBox(
                  width: width - 40,
                  child: Text(
                    caracsTitulo.join(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.normal,
                      color: Cores.amareloClaro,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 220,
                child: SizedBox(
                  width: width - 40,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 26, right: 26),
                    child: Text(
                      caracsDesc.join(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Cores.branco,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: bottom != null ? bottom!.value : -100,
                child: SizedBox(
                  width: width - 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * .5, 50),
                        backgroundColor: Cores.amarelo,
                      ),
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/explore',
                        (route) => false,
                      ),
                      child: Text(
                        'Explore Now',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Cores.preto,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
