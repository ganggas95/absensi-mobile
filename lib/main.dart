import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitampan_mobile/auth/screens/auth_screen.dart';
import 'package:sitampan_mobile/providers/shared_preferences_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  await initializeDateFormatting("id_ID", "en_US").then((value) {
    Intl.defaultLocale = "id_ID";
    timeago.setLocaleMessages('en', timeago.EnMessages());
    timeago.setLocaleMessages('id', timeago.IdMessages());
    timeago.setLocaleMessages('id_short', timeago.IdShortMessages());
    timeago.setDefaultLocale("id");
  });
  runApp(ProviderScope(overrides: [
    // override the previous value with the new object
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              primary: Colors.blueAccent,
              secondary: Colors.lightBlue,
              surface: Colors.black,
              seedColor: Colors.black),
          cardTheme: const CardTheme(
              color: Colors.white,
              clipBehavior: Clip.hardEdge,
              elevation: 2.0,
              shadowColor: Colors.blueGrey),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            iconColor: MaterialStateProperty.all(Colors.white),
          )),
          dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            actionsPadding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              titleTextStyle: GoogleFonts.josefinSans().copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1)),
          scaffoldBackgroundColor: const Color.fromARGB(1, 15, 23, 42),
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              iconColor: Colors.blueAccent,
              prefixStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 8,
              ),
              prefixIconColor: Colors.blueGrey,
              suffixStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 8,
              ),
              suffixIconColor: Colors.blueGrey,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
          useMaterial3: true,
          textTheme: GoogleFonts.josefinSansTextTheme()),
      home: const AuthScreen(),
      // home: const AuthenticatedScreen(),
    );
  }
}
