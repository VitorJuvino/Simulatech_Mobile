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
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);
    _initAudio();
  }

  // Função para inicializar a reprodução de áudio
  Future<void> _initAudio() async {
    await player.setSourceAsset('audio1.mpeg');
    await player.resume();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 118, 88, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 118, 88, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ausculta Simultânea',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 20),
          PlayerWidget(player: player),
        ],
      ),
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
  Duration _duration = Duration();
  Duration _position = Duration();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    widget.player.onDurationChanged.listen((position) {
      setState(() => _position = position);
    });
  }

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
              onPressed: () {
                if (!_isPlaying) {
                  widget.player.resume();
                  setState(() {
                    _isPlaying = true;
                    _isPaused = false;
                  });
                } else if (!_isPaused) {
                  widget.player.pause();
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
              onPressed: () {
                widget.player.stop();
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
        Slider(
          onChanged: (value) {
            final duration = _duration.inMilliseconds.toDouble();
            final position = value * duration;
            widget.player.seek(Duration(milliseconds: position.round()));
          },
          value: (_position != null &&
              _duration != null &&
              _position.inMilliseconds > 0 &&
              _position.inMilliseconds < _duration.inMilliseconds)
              ? _position.inMilliseconds / _duration.inMilliseconds
              : 0.0,
        ),
        Text(
          '${_positionText()} / ${_durationText()}',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  String _durationText() {
    return _duration.toString().split('.').first;
  }

  String _positionText() {
    return _position.toString().split('.').first;
  }
}
