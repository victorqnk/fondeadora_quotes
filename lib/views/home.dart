import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fondeadora/constants.dart';
import 'package:fondeadora/controllers/quote.dart';
import 'package:fondeadora/controllers/user.dart';
import 'package:fondeadora/models/quote.dart';
import 'package:fondeadora/widgets/author.dart';
import 'package:fondeadora/widgets/email.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  String getDate() {
    return DateFormat.yMMMd().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frase del día',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<UserController>().logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.format_quote,
                size: 180.0,
                color: Colors.grey.shade300,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: FutureBuilder(
                  future: context.read<QuoteController>().getQuote(),
                  builder: (context, AsyncSnapshot<Response> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Algo salió  mal'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    Quote? quote;
                    String? error;
                    Map<String, dynamic> map = jsonDecode(snapshot.data!.body);

                    try {
                      quote = Quote.fromMap(map);
                    } catch (e) {
                      error = map['error']['message'] ?? e.toString();
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getDate(),
                          style: kSecondaryText,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          quote?.quote ?? error!,
                          style: TextStyle(fontSize: 21.0),
                        ),
                        AuthorBox(quote?.author ?? 'Error'),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          EmailLogged(),
        ],
      ),
    );
  }
}
