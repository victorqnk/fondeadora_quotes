import 'package:flutter/material.dart';
import 'package:fondeadora/constants.dart';
import 'package:fondeadora/controllers/user.dart';
import 'package:fondeadora/views/home.dart';
import 'package:provider/provider.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: context.read<UserController>().logged
          ? Home()
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.contactless,
                      color: Colors.grey,
                      size: 60.0,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'FONDEADORA',
                            style: kMediumFont.copyWith(
                              color: Colors.white,
                              letterSpacing: 2.5,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: const Text('Entrar'),
                        ),
                      ],
                    ),
                    Image.asset(
                      'images/mastercard.png',
                      width: 120.0,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
