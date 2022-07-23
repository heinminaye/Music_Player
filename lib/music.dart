import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music/main.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  List MusicList = [
    {
      'title': "La Min Lay",
      'singer': "Artist",
      'url':
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/-La_min_Lay_(getmp3.pro).mp3",
    },
    {
      'title': "Amazing Day",
      'singer': "Artist",
      'url':
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/Amazing_Day_(getmp3.pro).mp3",
    },
    {
      'title': "Let Somebody GO",
      'singer': "Artist",
      'url':
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3",
    },
    {
      'title': "Min A Chit Kyaunt",
      'singer': "Artist",
      'url':
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/min_a_chit_kyaunt.mp3",
    },
    {
      'title': "Amazing Day",
      'singer': "Artist",
      'url':
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/Amazing_Day_(getmp3.pro).mp3",
    },
    {
      'title': "A Way",
      'singer': "Artist",
      'url':
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/Hugh_Grant_Haley_Bennett_-_A_Way_(getmp3.pro).mp3",
    }
  ];
  String currentTitle = '';
  String currentSinger = '';
  String currentSong = '';
  AudioPlayer audioPlayer = AudioPlayer();

  bool play = false;

  Duration duration = new Duration();
  Duration position = new Duration();

  bool check = true;

  void playMusic(String url) async {
    if (play && currentSong != url) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!play) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          play = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          color: Colors.black12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('images/music.jpeg'),
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentTitle,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6),
                        ),
                        Text(
                          currentSinger,
                          style: TextStyle(color: Colors.white60),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: check
                      ? Container()
                      : IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            if (play) {
                              audioPlayer.pause();
                              setState(() {
                                play = false;
                              });
                            } else {
                              audioPlayer.resume();
                              setState(() {
                                play = true;
                              });
                            }
                          },
                          icon: (play)
                              ? const Icon(Icons.pause)
                              : const Icon(Icons.play_arrow),
                        ),
                ),
              ]),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text("Music"),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 211, 74, 64)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text("Logout"))
        ]),
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomList(
                    title: MusicList[0]['title'],
                    singer: MusicList[0]['singer'],
                    currentList: () {
                      playMusic(MusicList[0]['url']);
                      setState(() {
                        currentTitle = MusicList[0]['title'];
                        currentSinger = MusicList[0]['singer'];
                        check = false;
                      });
                    },
                  ),
                  CustomList(
                    title: MusicList[1]['title'],
                    singer: MusicList[1]['singer'],
                    currentList: () {
                      playMusic(MusicList[1]['url']);
                      setState(() {
                        currentTitle = MusicList[1]['title'];
                        currentSinger = MusicList[1]['singer'];
                        check = false;
                      });
                    },
                  ),
                  CustomList(
                    title: MusicList[2]['title'],
                    singer: MusicList[2]['singer'],
                    currentList: () {
                      playMusic(MusicList[2]['url']);
                      setState(() {
                        currentTitle = MusicList[2]['title'];
                        currentSinger = MusicList[2]['singer'];
                        check = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomList extends StatelessWidget {
  var title;
  var singer;
  Function currentList;
  CustomList({Key? key, this.title, this.singer, required this.currentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.40),
              Colors.white.withOpacity(0.30),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: Colors.white,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            return currentList();
          },
          child: Row(children: [
            const Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image(
                      image: AssetImage("images/music.jpeg"),
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ))),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                const Padding(
                  padding: EdgeInsets.all(7),
                ),
                Text(
                  singer,
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
