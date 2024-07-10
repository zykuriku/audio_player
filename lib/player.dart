
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerScreen extends StatefulWidget {
  final String songPath;
  final String name;
  final String photoPath;

  PlayerScreen({required this.songPath, required this.name,required this.photoPath});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = true;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer.play(AssetSource(widget.songPath));
  }
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(AssetSource( widget.songPath));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _stop() {
    _audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Now Playing',
          style: TextStyle(
            color: Colors.white
          ),),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.photoPath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
      Colors.white.withOpacity(0.6),
      BlendMode.dstATop),
          ),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15.0)
                ),
      
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.name}',
                    style: TextStyle(fontSize: 24,
                    color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 64,
                    color: Colors.redAccent,
                    onPressed: _playPause,
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.redAccent,
                    iconSize: 64,
                    onPressed: _stop,
                  ),
                ],
              ),
              SizedBox(height: 100.0,)
            ],
          ),
        ),
      ),
    );
  }
}
