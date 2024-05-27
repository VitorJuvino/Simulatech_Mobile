import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AuscultaCardiaca()));
}

class AuscultaCardiaca extends StatefulWidget {
  @override
  _AuscultaCardiacaState createState() => _AuscultaCardiacaState();
}

class _AuscultaCardiacaState extends State<AuscultaCardiaca> {
  late AudioPlayer player1;
  late AudioPlayer player2;
  late AudioPlayer player3;
  late AudioPlayer player4;
  late AudioPlayer player5;

  @override
  void initState() {
    super.initState();
    player1 = AudioPlayer();
    player2 = AudioPlayer();
    player3 = AudioPlayer();
    player4 = AudioPlayer();
    player5 = AudioPlayer();

    player1.setReleaseMode(ReleaseMode.stop);
    player2.setReleaseMode(ReleaseMode.stop);
    player3.setReleaseMode(ReleaseMode.stop);
    player4.setReleaseMode(ReleaseMode.stop);
    player5.setReleaseMode(ReleaseMode.stop);

    _initAudio();
  }

  // Função para inicializar a reprodução de áudio
  Future<void> _initAudio() async {
    await player1.setSourceAsset('Atritopericardico.m4a');
    await player2.setSourceAsset('EstenoseAortica.m4a');
    await player3.setSourceAsset('Murmuriodiastolico.mp3');
    await player4.setSourceAsset('MurmurioSistolico.mp3');
    await player5.setSourceAsset('ProlapsoValvulaMitral.m4a');
  }

  @override
  void dispose() {
    player1.dispose();
    player2.dispose();
    player3.dispose();
    player4.dispose();
    player5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 118, 88, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 118, 88, 1),
        title: Text(
          'Ausculta Cardíaca',
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
            AudioContainer(
              player: player1,
              description: 'Atritopericardico',
              information: 'Informações sobre o áudio 1',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player2,
              description: 'EstenoseAortica',
              information: 'Informações sobre o áudio 2',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player3,
              description: 'Murmuriodiastolico',
              information: 'Informações sobre o áudio 3',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player4,
              description: 'MurmurioSistolico',
              information: 'Informações sobre o áudio 4',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player5,
              description: 'ProlapsoValvulaMitral',
              information: 'Informações sobre o áudio 5',
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

