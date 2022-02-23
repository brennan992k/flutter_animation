import 'package:flutter/material.dart';
import 'package:test/src/components/Heart.dart';
import 'package:test/src/models/Trip.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lipsum/lipsum.dart' as lipsum;

class Details extends StatelessWidget {
  final Trip trip;
  const Details({required this.trip, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
                child: Hero(
                    tag: 'trip-img-${trip.img}',
                    child: Image.asset(
                      'assets/images/${trip.img}',
                      height: 360,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ))),
            const SizedBox(height: 30),
            ListTile(
                title: Text(trip.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800])),
                subtitle: Text(
                    '${trip.nights} night stay for only \$${trip.price}',
                    style: const TextStyle(letterSpacing: 1)),
                trailing: Heart(
                  isFav: true,
                )),
            Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                    lipsum.createText(numParagraphs: 1, numSentences: 3),
                    style: TextStyle(color: Colors.grey[600], height: 1.4))),
          ],
        ));
  }
}
