import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

class AudioPlayerHH extends StatefulWidget {
  @override
  AudioPlayerHHState createState() => AudioPlayerHHState();
}

class MostrarCuadroTexto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.grey),
      ),
      title: Column(children: [
        const Text(
          'Todo va a estar bien',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        SizedBox(height: 10),
        Image(
          image: AssetImage('assets/images/friends.png'),
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ]),
      content: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          //borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
        ),
        child: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Estamos cargando tus contactos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\n En unos segundos, podrás llamar a una persona de confianza y se le enviará un mensaje automático de emergencia con tu ubicación.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioPlayerHHState extends State<AudioPlayerHH> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  List<String> path = [
    'audios/audio1.mp3',
    'audios/audio2.mp3',
    'audios/audio3.mp3',
    'audios/audio5.mp3'
  ];
  //String path = 'audios/bien.mp3';

  @override
  void initState() {
    super.initState();

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  playMusic() async {
    final _random = new Random();
    var random_audio = path[_random.nextInt(path.length)];
    await audioCache.play(random_audio);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      //color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("¡Estamos aquí para ti!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
          SizedBox(height: size.height * 0.02),
          // Text("Escucha algunas palabras \n reconfortantes más abajo",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0)),
          // SizedBox(height: size.height * 0.02),
          Image(
            image: AssetImage('assets/images/relax.png'),
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.02),
          IconButton(
            iconSize: 50,
            onPressed: () {
              audioPlayerState == AudioPlayerState.PLAYING
                  ? pauseMusic()
                  : playMusic();
            },
            icon: Icon(
              audioPlayerState == AudioPlayerState.PLAYING
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              color: Colors.deepPurple,
            ),
          ),
          Text("Date un respiro. Dale play.",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0)),
          SizedBox(height: size.height * 0.05),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minimumSize: Size(120.0, 40.0), // background (button) color
                onPrimary: Colors.white, // foreground (text) color
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'contacts2');
                showDialog(
                    useRootNavigator: false,
                    context: context,
                    builder: (context) {
                      return MostrarCuadroTexto();
                    });
              },
              child: Text('¡Estoy en pánico!')),
        ],
      ),
    );
  }

  Future<void> _saveActivity(BuildContext context) {
    Navigator.pushNamed(context, "contacts2");
    // return showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   useSafeArea: false,
    //   useRootNavigator: false,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: Text('Success!'),
    //     content: Text('You are in the football universe!'),

    //   )
    // );
  }
}
