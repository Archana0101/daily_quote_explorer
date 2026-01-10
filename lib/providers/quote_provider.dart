import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote.dart';

class QuoteProvider extends ChangeNotifier {
  // -----------------------------
  // QUOTES LIST
  // -----------------------------
  final List<Quote> _quotes = [
    Quote(id: 1, text: "Believe in yourself", author: "Dr. Joseph Murphy"),
    Quote(id: 2, text: "Never give up", author: "John Mason"),
    Quote(id: 3, text: "It is never too late to be what you might have been.", author: "George Eliot"),
    Quote(id: 4, text: "The only way to do great work is to love what you do", author: "Steve Jobs"),
    Quote(id: 5, text: "Imagination is more important than knowledge", author: "Albert Einstein"),
    Quote(id: 6, text: "It always seems impossible until it's done", author: "Nelson Mandela"),
    Quote(id: 7, text: "Goal setting is the secret to a compelling future", author: "Tony Robbins"),
    Quote(id: 8, text: "Life is a journey, not a destination.", author: "Ralph Waldo Emerson"),
    Quote(id: 9, text: "You can always edit a bad page. You can’t edit a blank page.", author: "Jodi Picoult"),
    Quote(id: 10, text: "The scariest moment is always just before you start", author: "Stephen King"),
    Quote(id: 11, text: "You fail only if you stop writing", author: "Ray Bradbury")
  ];

  // -----------------------------
  // CURRENT QUOTE
  // -----------------------------
  Quote _currentQuote = Quote(
    id: 1,
    text: "Believe in yourself",
    author: "Dr. Joseph Murphy",
  );

  Quote get currentQuote => _currentQuote;

  // -----------------------------
  // FAVORITES
  // -----------------------------
  final List<Quote> _favorites = [];
  List<Quote> get favorites => _favorites;

  QuoteProvider() {
    _loadFavorites();
  }

  // -----------------------------
  // RANDOM QUOTE
  // -----------------------------
  void getRandomQuote() {
    final random = Random();
    _currentQuote = _quotes[random.nextInt(_quotes.length)];
    notifyListeners();
  }

  // -----------------------------
  // CHECK FAVORITE
  // -----------------------------
  bool isFavorite(Quote quote) {
    return _favorites.any((q) => q.id == quote.id);
  }

  // -----------------------------
  // ADD TO FAVORITES
  // -----------------------------
  Future<void> addToFavorites(Quote quote) async {
    if (!isFavorite(quote)) {
      _favorites.add(quote);
      await _saveFavorites();
      notifyListeners();
    }
  }

  // -----------------------------
  // REMOVE FROM FAVORITES
  // -----------------------------
  Future<void> removeFromFavorites(Quote quote) async {
    _favorites.removeWhere((q) => q.id == quote.id);
    await _saveFavorites();
    notifyListeners();
  }

  // -----------------------------
  // SAVE FAVORITES (SharedPreferences)
  // -----------------------------
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = _favorites
        .map((q) => "${q.id}|${q.text}|${q.author}")
        .toList();
    await prefs.setStringList('favorites', favList);
  }

  // -----------------------------
  // LOAD FAVORITES
  // -----------------------------
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];

    _favorites.clear();
    for (var item in favList) {
      final parts = item.split('|');
      _favorites.add(
        Quote(
          id: int.parse(parts[0]),
          text: parts[1],
          author: parts[2],
        ),
      );
    }
    notifyListeners();
  }
}
