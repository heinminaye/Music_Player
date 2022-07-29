class Song {
  late String url;
  String title;
  String singer;

  Song({required this.url, required this.title, required this.singer});
}

class Playlist {
  List<Song> _myplaylist = [
    Song(
      title: "La Min Lay",
      singer: "Artist",
      url:
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/-La_min_Lay_(getmp3.pro).mp3",
    ),
    Song(
      title: "Amazing Day",
      singer: "Artist",
      url:
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/Amazing_Day_(getmp3.pro).mp3",
    ),
    Song(
      title: "Let Somebody GO",
      singer: "Artist",
      url:
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3",
    ),
    Song(
      title: "Min A Chit Kyaunt",
      singer: "Artist",
      url:
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/min_a_chit_kyaunt.mp3",
    ),
    Song(
      title: "Away",
      singer: "Artist",
      url:
          "https://msicoursematerial.s3.us-west-2.amazonaws.com/Hugh_Grant_Haley_Bennett_-_A_Way_(getmp3.pro).mp3",
    )
  ];
  String getUrl(int index) {
    return _myplaylist[index].url;
  }

  String getTitle(int index) {
    return _myplaylist[index].title;
  }

  String getArtist(int index) {
    return _myplaylist[index].singer;
  }

  int getLength() {
    return _myplaylist.length;
  }
}
