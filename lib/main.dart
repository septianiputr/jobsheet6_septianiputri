import 'package:flutter/material.dart';

class StateTeksUtama extends State<TeksUtama> {
  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  final List<String> listNama = [
    'Septiani Putri', 'Sri Mulyaningsih', 'Salsabila Ika Nur Rohmah', 'Irham Maulana', 'Riki Nur Alim', 'Apik Maulidah P'
  ];

  final List<Color> listWarna = [
    Colors.red, Colors.purple, Colors.teal, Colors.lime, Colors.indigo, Colors.deepPurple, Colors.cyan, Colors.blue, Colors.yellow
  ];

  final List<String> listFoto = [
    'images/septi.jpg',
    'images/sri.jpg',
    'images/salsa.jpg',
    'images/irham.jpg', 
    'images/riki.jpg',
    'images/apik.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Apa kabar',
          textDirection: TextDirection.ltr,
        ),
        SizedBox(height: 10),
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(listFoto[index % listFoto.length]),
        ),
        SizedBox(height: 10),
        Text(
          listNama[index % listNama.length],
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: listWarna[index % listWarna.length],
          ),
        ),
      ],
    );
  }
}

class TeksUtama extends StatefulWidget {
  TeksUtama({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateTeksUtama();
}

void main() {
  final GlobalKey<StateTeksUtama> _key = GlobalKey<StateTeksUtama>();

  runApp(
    MaterialApp(
      title: 'Halo Dunia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halo Dunia'),
        ),
        body: Center(
          child: TeksUtama(key: _key),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh',
          child: Icon(Icons.refresh),
          onPressed: () {
            _key.currentState?.incrementIndex();
          },
        ),
      ),
    ),
  );
}