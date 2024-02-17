import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final IconData cardIcon;
  final String title;
  final String data;

  const MiniCard(this.cardIcon, this.title, this.data, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(149, 0, 0, 0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              cardIcon,
              size: 30,
              color: Color.fromARGB(255, 237, 178, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              data,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
