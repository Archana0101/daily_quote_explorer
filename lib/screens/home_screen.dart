import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuoteProvider>(context);

    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.currentQuote.text,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            Text(
              "- ${provider.currentQuote.author}",
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: provider.getRandomQuote,
              child: const Text(" Get New Quote"),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                provider.addToFavorites(provider.currentQuote);
              },
              child: Text(
                provider.isFavorite(provider.currentQuote)
                    ? "Added to Favorites"
                    : "Save to Favorites",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
