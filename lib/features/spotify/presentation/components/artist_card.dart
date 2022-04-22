import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({Key? key, required this.imageURL, required this.name})
      : super(key: key);
  final String imageURL;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(imageURL),
                  backgroundColor: Colors.transparent,
                )),
            Expanded(
                child: Center(
              child: Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.normal, fontSize: 16)),
            ))
          ],
        ),
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15));
  }
}
