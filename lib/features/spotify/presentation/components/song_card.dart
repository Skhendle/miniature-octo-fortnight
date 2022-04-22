import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  const SongCard({Key? key, required this.imageURL, required this.name})
      : super(key: key);
  final String imageURL;
  final String name;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;
    return Container(
        child: Row(
          children: [
            Container(
                height: 300,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageURL), fit: BoxFit.fill))),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text('Song Name',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ))),
                  Expanded(
                      child: Text('Artist/s Name/s',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14))),
                  Expanded(
                      child: Text('Time',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.normal, fontSize: 14)))
                ],
              ),
            )
          ],
        ),
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15));
  }
}
