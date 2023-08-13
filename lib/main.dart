import 'package:astroverse/pages/HomePage.dart';
import 'package:flutter/material.dart'; 


void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'AstroVerse',
			theme: ThemeData(
				colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8AAAE5)),
				useMaterial3: true,
			),
			home: const HomePage(title: 'ASTROVERSE'),
		);
	}
}
