import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(
      MaterialApp(
        home: PokemonPage(),
      ),
    );

class PokemonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Pokemon Partner',
            style: TextStyle(
              fontFamily: 'PokemonSolid',
              fontSize: 26.0,
              color: Colors.yellow,
            ),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Pokemon(),
    );
  }
}

class Pokemon extends StatefulWidget {
  @override
  _PokemonState createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  int pokemonNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FlatButton(
            onPressed: () {
              if (pokemonNumber == 0) {
                final player = AudioCache();
                player.play('pokemonout.mp3');
              }
              setState(() {
                pokemonNumber = Random().nextInt(4) + 1;
                final player = AudioCache();
                player.play('pokemon$pokemonNumber.mp3');
              });
            },
            child: Image.asset('images/pokemon$pokemonNumber.png'),
          ),
        ),
        Center(
          child: FlatButton(
            onPressed: () {
              if (pokemonNumber != 0) {
                setState(() {
                  pokemonNumber = 0;
                  final player = AudioCache();
                  player.play('pokemonreturn.mp3');
                });
              }
            },
            child: Image.asset('images/button.png'),
          ),
        ),
      ],
    );
  }
}
