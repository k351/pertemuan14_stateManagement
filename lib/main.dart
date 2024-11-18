import 'package:flutter/material.dart';
import 'package:pertemuan14_statemanagement/home.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';
import 'fontprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FontProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final fontProvider = context.watch<FontProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeProvider.currentTheme.copyWith(
        textTheme: themeProvider.currentTheme.textTheme.apply(
          fontFamily: fontProvider.fontFamily,
        ),
      ),
      home: const MyHomePage(title: "flutter"),
    );
  }
}
