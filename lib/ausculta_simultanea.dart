import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ausculta_simultanea()));
}

class ausculta_simultanea extends StatefulWidget {
  @override
  _ausculta_simultaneaState createState() => _ausculta_simultaneaState();
}

class _ausculta_simultaneaState extends State<ausculta_simultanea> {
  late AudioPlayer player1;
  late AudioPlayer player2;
  late AudioPlayer player3;
  late AudioPlayer player4;
  late AudioPlayer player5;
  late AudioPlayer player6;
  late AudioPlayer player7;
  late AudioPlayer player8;
  late AudioPlayer player9;
  late AudioPlayer player10;
  late AudioPlayer player11;
  late AudioPlayer player12;

  @override
  void initState() {
    super.initState();
    player1 = AudioPlayer();
    player2 = AudioPlayer();
    player3 = AudioPlayer();
    player4 = AudioPlayer();
    player5 = AudioPlayer();
    player6 = AudioPlayer();
    player7 = AudioPlayer();
    player8 = AudioPlayer();
    player9 = AudioPlayer();
    player10 = AudioPlayer();
    player11 = AudioPlayer();
    player12 = AudioPlayer();

    player1.setReleaseMode(ReleaseMode.stop);
    player2.setReleaseMode(ReleaseMode.stop);
    player3.setReleaseMode(ReleaseMode.stop);
    player4.setReleaseMode(ReleaseMode.stop);
    player5.setReleaseMode(ReleaseMode.stop);
    player6.setReleaseMode(ReleaseMode.stop);
    player7.setReleaseMode(ReleaseMode.stop);
    player8.setReleaseMode(ReleaseMode.stop);
    player9.setReleaseMode(ReleaseMode.stop);
    player10.setReleaseMode(ReleaseMode.stop);
    player11.setReleaseMode(ReleaseMode.stop);
    player12.setReleaseMode(ReleaseMode.stop);

    _initAudio();
  }

  // Função para inicializar a reprodução de áudio
  Future<void> _initAudio() async {
    await player1.setSourceAsset('Crepitoforte.m4a');
    await player2.setSourceAsset('CrepitoFraco.mp3');
    await player3.setSourceAsset('Estridor.mp3');
    await player4.setSourceAsset('Normalbc.mp3');
    await player5.setSourceAsset('Pneumonia.m4a');
    await player6.setSourceAsset('Ronco.mp3');
    await player7.setSourceAsset('Sibilos.mp3');

    await player8.setSourceAsset('Atritopericardico.m4a');
    await player9.setSourceAsset('EstenoseAortica.m4a');
    await player10.setSourceAsset('Murmuriodiastolico.mp3');
    await player11.setSourceAsset('MurmurioSistolico.mp3');
    await player12.setSourceAsset('ProlapsoValvulaMitral.m4a');
  }

  @override
  void dispose() {
    player1.dispose();
    player2.dispose();
    player3.dispose();
    player4.dispose();
    player5.dispose();
    player6.dispose();
    player7.dispose();
    player8.dispose();
    player9.dispose();
    player10.dispose();
    player11.dispose();
    player12.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 118, 88, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 118, 88, 1),
        title: Text(
          'Ausculta Simultânea',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset('assets/logo.jpeg', height: 280),
            SizedBox(height: 20),
            Text(
              'Ausculta Pulmonar',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 10),
            AudioContainer(
              player: player1,
              description: 'Crepitoforte',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player2,
              description: 'CrepitoFraco',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player3,
              description: 'Estridor',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player4,
              description: 'Normalbc',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player5,
              description: 'Pneumonia',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player6,
              description: 'Ronco',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player7,
              description: 'Sibilos',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            Text(
              'Ausculta Cardíaca',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 10),
            AudioContainer(
              player: player8,
              description: 'Atritopericardico',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player9,
              description: 'EstenoseAortica',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player10,
              description: 'Murmuriodiastolico',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player11,
              description: 'MurmurioSistolico',
              information: 'Informações sobre o áudio',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player12,
              description: 'ProlapsoValvulaMitral',
              information: 'Informações sobre o áudio',
            ),
          ],
        ),
      ),
    );
  }
}

class AudioContainer extends StatelessWidget {
  final AudioPlayer player;
  final String description;
  final String information;

  const AudioContainer({
    required this.player,
    required this.description,
    required this.information,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  _showInformation(context);
                },
                icon: Icon(Icons.help_outline),
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 8),
          PlayerWidget(player: player),
        ],
      ),
    );
  }

  void _showInformation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações'),
          content: Text(information),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}

class PlayerWidget extends StatefulWidget {
  final AudioPlayer player;

  const PlayerWidget({
    required this.player,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  bool _isPlaying = false;
  bool _isPaused = false;

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                if (!_isPlaying) {
                  await widget.player.resume();
                  setState(() {
                    _isPlaying = true;
                    _isPaused = false;
                  });
                } else if (!_isPaused) {
                  await widget.player.pause();
                  setState(() {
                    _isPlaying = false;
                    _isPaused = true;
                  });
                }
              },
              icon: _isPlaying
                  ? Icon(Icons.pause)
                  : Icon(Icons.play_arrow),
              color: color,
            ),
            IconButton(
              onPressed: () async {
                await widget.player.stop();
                setState(() {
                  _isPlaying = false;
                  _isPaused = false;
                });
              },
              icon: Icon(Icons.stop),
              color: color,
            ),
          ],
        ),
      ],
    );
  }
}

