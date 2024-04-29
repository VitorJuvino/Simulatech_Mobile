import 'package:flutter/material.dart';

import 'ausculta_cardiaca.dart';
import 'ausculta_pulmonar.dart';
import 'ausculta_simultanea.dart';

void main() {
  runApp(
    MaterialApp(
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => MyApp(),
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 118, 88, 1),
      body: Column(
        children: [
          SizedBox(height: 60),
          Image.asset(
            'assets/logo.jpeg',
            width: 280,
            height: 280,
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuscultaPulmonar()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            'assets/pulmao.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ausculta Pulmonar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuscultaCardiaca()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            'assets/coracao.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ausculta Cardíaca',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ausculta_simultanea()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/pulmao.png',
                                width: 60,
                                height: 60,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset(
                                  'assets/coracao.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ausculta Simultânea',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ausculta_simultanea()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            'assets/cuidados-de-saude.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Outros Sons',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


