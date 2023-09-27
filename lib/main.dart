import 'package:flutter/material.dart';
import 'package:watchlistsort/screen/watchlist_data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Watchlist',
      debugShowCheckedModeBanner: false,
      home: WatchlistDataUI(),
    );
  }
}
