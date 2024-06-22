import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'dart:convert';

class QuoteGenerator extends StatefulWidget {
  const QuoteGenerator({super.key});

  @override
  State<QuoteGenerator> createState() => _QuoteGeneratorState();
}

class _QuoteGeneratorState extends State<QuoteGenerator> {
  final String quoteURL = "https://api.adviceslip.com/advice";
  String quote = 'Random Quote';


  @override


  Future<void> generateQuote() async {
    try {
      final response = await http.get(Uri.parse(quoteURL));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        setState(() {
          quote = result["slip"]["advice"];
        });
      } else {
        setState(() {
          quote = 'Failed to fetch quote';
        });
      }
    } catch (e) {
      setState(() {
        quote = 'Failed to fetch quote';
      });
    }
  }

  void shareQuote() {
    if (quote.isNotEmpty && quote != 'Failed to fetch quote' && quote != 'Random Quote') {
      Share.share(quote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff09A6F3), Color(0xffffc6ff), Color(0xffcaffbf)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  quote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: generateQuote,
                  child: const Text('Generate'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: shareQuote,
                  child: const Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
