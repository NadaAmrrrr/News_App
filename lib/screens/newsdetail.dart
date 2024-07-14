import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/first.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with content
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40), // Space for status bar
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Crypto investors should be prepared to lose all their money, BOE governor says',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Sunday, 9 May 2021',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'LONDON — Cryptocurrencies "have no intrinsic value" and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.\n\n'
                      'Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.\n\n'
                      'Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: "They have no intrinsic value. That doesn’t mean to say that people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value."',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
