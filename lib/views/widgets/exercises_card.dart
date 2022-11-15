import 'package:flutter/material.dart';

class ExercisesCard extends StatelessWidget {
  final String title;
  final String type;
  final String keywords;
  ExercisesCard({
    required this.title,
    required this.keywords,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.fromLTRB(20, 15, 0, 0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(type),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                keywords,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ));
  }
}
