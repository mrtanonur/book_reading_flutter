import 'package:book_reading_flutter/pages/book_page.dart';
import 'package:book_reading_flutter/providers/book_provider.dart';
import 'package:book_reading_flutter/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/config/themes/themes.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MainProvider()),
      ChangeNotifierProvider(create: (context) => BookProvider()),
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: context.watch<MainProvider>().themeMode,
      home: const BookPage(),
    );
  }
}
