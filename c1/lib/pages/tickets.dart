import 'package:c1/styles/styles.dart';
import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  List dias = [];
  List semana = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  Map selecionado = {};

  int number1 = 0;
  int number2 = 0;

  @override
  void initState() {
    dias = List.generate(
      30,
      (index) => {
        'dia': (index + 1).toString().padLeft(2, '0'),
        'disponivel':
            (index + 1) > 12 &&
            ((index + 1) != 17 && (index + 1) >= 13) &&
            ((index + 1) != 24 && (index + 1) >= 13),
      },
    );
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print(dias);
    return Scaffold(
      backgroundColor: Cores.preto,
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      height: 300,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width,
                            height: 300,
                            child: Image.asset(
                              'assets/images/museum.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: width,
                            height: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color.fromARGB(104, 0, 0, 0),
                                  Cores.preto,
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Official\nTicketing Service',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: Cores.branco,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1. Date to visit',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  color: Cores.amarelo,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => (),
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Cores.branco,
                                    ),
                                  ),
                                  Text(
                                    'September',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Cores.branco,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => (),
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Cores.branco,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var s in semana)
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    s,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Cores.amarelo,
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          SizedBox(
                            width: width,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                for (var dia in dias)
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (dia['disponivel']) {
                                          setState(() {
                                            selecionado = dia;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: width * .103,
                                        height: width * .103,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: dia == selecionado
                                                ? Cores.amarelo
                                                : Cores.preto,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            dia['dia'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: dia == selecionado
                                                  ? Cores.amarelo
                                                  : dia['disponivel']
                                                  ? Cores.branco
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          Text(
                            '2. Number of Tickets',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              color: Cores.amarelo,
                            ),
                          ),
                          Container(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * .65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'General Admission:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Cores.branco,
                                      ),
                                    ),
                                    Text(
                                      '€22',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                        color: Cores.amarelo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * .25,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (number1 > 0) {
                                              number1--;
                                            }

                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: Cores.branco,
                                          ),
                                        ),
                                        Text(
                                          number1.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Cores.branco,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            if (number1 < 9) {
                                              number1++;
                                            }

                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Cores.branco,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * .65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Under 18s, Under 26s residents of the EEA, Museum members, Professionals:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Cores.branco,
                                      ),
                                    ),
                                    Text(
                                      'FREE',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                        color: Cores.amarelo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * .25,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (number2 > 0) {
                                              number2--;
                                            }

                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: Cores.branco,
                                          ),
                                        ),
                                        Text(
                                          number2.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Cores.branco,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            if (number2 < 9) {
                                              number2++;
                                            }

                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Cores.branco,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: 100,
              color: Cores.amarelo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total: € 44',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Cores.cinza,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.preto,
                      fixedSize: Size(width * .35, 46),
                    ),
                    onPressed: () => (),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Cores.amarelo,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
