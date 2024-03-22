import 'package:flutter/material.dart';

class Sismo {
  String titulo;
  String subtitulo;

  Sismo({required this.titulo, required this.subtitulo});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key}); 
  Color miColor = Color(0xFFf1751a);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sismos',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _appBar(),
              _content(),
              _mapa(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomAppBar(),
      ),
    );
  }

  AppBar _content() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildButton('MAPA'),
          ),
          Expanded(
            child: _buildButton('LISTA'),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return InkWell(
      onTap: () {
        print('Tocaste $text');
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                color: text == 'MAPA' ? Color.fromRGBO(241, 1117, 26, 1) : Colors.black,
              ),
            ),
            if (text == 'MAPA')
              Container(
                width: double.infinity,
                height: 2.0,
                color: miColor
              ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Sismos'),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: IconButton(
            icon: _buildCustomQuestionIcon(),
            onPressed: () {
              print('Presionaste el icono de pregunta');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCustomQuestionIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: miColor,
          ),
        ),
        Icon(
          Icons.help_outline,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _mapa() {
    return Expanded(
      child: Stack(
        children: [
          Image.asset(
            'assets/img/mapa.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButtonn('24 horas', Icons.access_time, Colors.orange),
                SizedBox(width: 10),
                _buildButtonn('15 días', Icons.calendar_today,
                    const Color.fromARGB(255, 66, 64, 64)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonn(String text, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {
        print('Presionaste el botón: $text');
      },
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  print('Sismos');
                },
                icon: Icon(
                  Icons.circle_notifications,
                  color: miColor,
                ),
                tooltip: 'Sismos',
              ),
              Text(
                'Sismos',
                style: TextStyle(
                  color: miColor,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  print('Lo sentiste');
                },
                icon: Icon(
                  Icons.person_3_sharp,
                  color: Colors.grey,
                ),
                tooltip: '¿Lo sentiste?',
              ),
              Text(
                'Lo sentiste',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  print('Más');
                },
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                tooltip: 'Más',
              ),
              Text(
                'Más',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
