import 'package:flutter/material.dart';
import '../components/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '5File',
        ),
        backgroundColor: const Color.fromARGB(255, 0, 150, 137),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: const Menu(),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Center(
                          child: Text(
                              'Üdvözöl a 5File mobilalkalmazása!',
                              style: TextStyle(
                                fontSize: 20.0
                              ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 8, 4, 0),
                      child: Center(
                          child: Text(
                            'Az alkalmazás kizárólag korlátozott funkciókat biztosít! Teljes körű használatért látogass el a FiveFile böngészőből elérhető alkalmazására!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
