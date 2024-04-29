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

  @override
  void initState() {
    super.initState();
    player1 = AudioPlayer();
    player2 = AudioPlayer();
    player3 = AudioPlayer();

    player1.setReleaseMode(ReleaseMode.stop);
    player2.setReleaseMode(ReleaseMode.stop);
    player3.setReleaseMode(ReleaseMode.stop);

    _initAudio();
  }

  // Função para inicializar a reprodução de áudio
  Future<void> _initAudio() async {
    await player1.setSourceAsset('audio1.mpeg');
    await player2.setSourceAsset('audio1.mpeg');
    await player3.setSourceAsset('audio1.mpeg');
  }

  @override
  void dispose() {
    player1.dispose();
    player2.dispose();
    player3.dispose();
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
            AudioContainer(
              player: player1,
              description: 'Descrição do áudio 1',
              information: 'Informações sobre o áudio 1',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player2,
              description: 'Descrição do áudio 2',
              information: 'Informações sobre o áudio 2',
            ),
            SizedBox(height: 20),
            AudioContainer(
              player: player3,
              description: 'Descrição do áudio 3',
              information: 'Informações sobre o áudio 3',
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

