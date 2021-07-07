import 'package:flutter/material.dart';
import 'package:fondeadora/constants.dart';

class AuthorBox extends StatelessWidget {
  final String author;
  const AuthorBox(this.author);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Text(
          author,
          style: kMediumFont,
        ),
      ),
    );
  }
}
