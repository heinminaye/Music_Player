import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music/main.dart';
import 'main.dart';
import 'songList.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  Playlist playlist = Playlist();
  String currentTitle = '';
  String currentSinger = '';
  String currentSong = '';
  AudioPlayer audioPlayer = AudioPlayer();

  bool play = false;

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
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6),
                        ),
                        Text(
                          currentSinger,
                          style: const TextStyle(color: Colors.white60),
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
        automaticallyImplyLeading: false,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text("Music"),
          Container(
            height: 25,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 211, 74, 64)),
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
                child: const Text("Logout")),
          )
        ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: playlist.getLength(),
                itemBuilder: ((context, index) => CustomList(
                      title: playlist.getTitle(index),
                      singer: playlist.getArtist(index),
                      currentList: () {
                        playMusic(playlist.getUrl(index));
                        setState(() {
                          currentTitle = playlist.getTitle(index);
                          currentSinger = playlist.getArtist(index);
                          check = false;
                        });
                      },
                    )),
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
