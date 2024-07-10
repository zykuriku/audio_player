import 'package:audio_player/player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: SongListScreen(),
    );
  }
}

class SongListScreen extends StatelessWidget {
  final List<String> songs = [
    'music1.mp3',
    'music2.mp3',
  ];
  final List<String> songsName = [
    'Scam 1992 ringtone',
    'Dhoom theme song',

  ];
  final List<String> photo = [
    'assets/scam.jpg',
    'assets/dhoom.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.music_note_rounded,
        color: Colors.white,),
        backgroundColor: Colors.redAccent,
        title: Text('Songs List',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.play_circle_fill_rounded,
              size: 50.0,
              color: Colors.redAccent,),

              title: Text(songsName[index],
              style: TextStyle(
                color: Colors.redAccent.shade700,
                fontSize: 20.0
              ),),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerScreen(songPath: songs[index], name: songsName[index], photoPath: photo[index],),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
