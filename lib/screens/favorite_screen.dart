import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuoteProvider>(context);

    //  CASE 1: No favorites at all
    if (provider.favorites.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text(
            "No favourites yet",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    //  Filter favorites based on search
    final filteredQuotes = provider.favorites.where((quote) {
      return quote.text.toLowerCase().contains(searchText) ||
          quote.author.toLowerCase().contains(searchText);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Column(
        children: [
          //  SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search quotes...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
            ),
          ),

          //  LIST / EMPTY SEARCH RESULT
          Expanded(
            child: filteredQuotes.isEmpty
                ? const Center(
                    child: Text(
                      "No matching quotes",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredQuotes.length,
                    itemBuilder: (context, index) {
                      final quote = filteredQuotes[index];

                      return ListTile(
                        title: Text(quote.text),
                        subtitle: Text(quote.author),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            provider.removeFromFavorites(quote);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
