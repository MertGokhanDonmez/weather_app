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
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              cardIcon,
              size: MediaQuery.of(context).size.width * 0.055,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              data,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
