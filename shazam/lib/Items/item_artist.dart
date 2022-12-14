import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazam/Items/button_favorite.dart';
import 'package:shazam/detalles_page.dart';
import 'package:shazam/provider/provider_music.dart';

class ItemArtist extends StatelessWidget {
  final Map<String, dynamic> artist;
  ItemArtist({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> spotify = artist["spotify"];
    final Map<String, dynamic> album = spotify["album"];
    final List<dynamic> images = album["images"];
    return Container(
      width: 180,
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(25),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetallesArtist(Element: artist),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(children: [
            Positioned.fill(
              child: Image.network(
                "${images[0]["url"]}",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Color.fromARGB(255, 82, 105, 234),
                ),
                padding: EdgeInsets.only(bottom: 15),
                child: Column(children: [
                  Text(
                    "${artist["artist"]}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${artist["title"]}",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ),
            Positioned(
              child: ButtonFavorite(artist: artist),
            )
          ]),
        ),
      ),
    );
  }
}
