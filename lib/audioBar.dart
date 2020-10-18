import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AudioBar extends StatefulWidget {
  AudioBar(this.localFilePath);
  final String localFilePath;

  @override
  _AudioBarState createState() => _AudioBarState();
}

class _AudioBarState extends State<AudioBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String localFileUri = "";
  Duration _duration = Duration(minutes: 1);
  Duration _position = Duration(minutes: 0);

  void _seek(int second) {
    Duration _newDuration = Duration(seconds: second);
    _audioPlayer.seek(_newDuration);
  }

  void _loadFile() async {
    await _audioPlayer.play(localFileUri, isLocal: true);
    _audioPlayer.pause();
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    super.initState();
    _makePlayer();
  }

  Future _loadSound() async {
    //print("---------------------------------------------");
    //print(widget.localFilePath);
    //print("---------------------------------------------");
    final ByteData data = await rootBundle.load(widget.localFilePath);
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File("${tempDir.path}/Altes-Rathaus.mp3");
    await tempFile.writeAsBytes(data.buffer.asInt8List(), flush: true);
    localFileUri = tempFile.path;
    //setState(() {});
  }

  void _makePlayer() {
    _loadSound().then((value) => _loadFile());
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _controller,
            ),
            color: Color(0xffa0c510),
            onPressed: () {
              //final myPlayer = AudioCache();
              //myPlayer.play("Altes-Rathaus.mp3");
              setState(() {
                isPlaying = !isPlaying;
                if (isPlaying == true) {
                  _controller.forward();
                  _audioPlayer.resume();
                } else {
                  _controller.reverse();
                  _audioPlayer.pause();
                }
              });
            },
            iconSize: 40.0,
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Color(0xffa0c510),
                thumbColor: Color(0xffa0c510),
                inactiveTrackColor: Colors.grey[500],
                overlayColor: Color(0xffa0c510).withAlpha(50),
              ),
              child: Slider(
                min: 0.0,
                max: _duration.inSeconds.toDouble() ?? 1,
                value: _position.inSeconds.toDouble() ?? 0,
                onChanged: (double value) {
                  print(widget.localFilePath);
                  setState(() {
                    _seek(value.toInt());
                    value = value;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
