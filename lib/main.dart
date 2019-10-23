import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			localizationsDelegates: [
				GlobalMaterialLocalizations.delegate,
				GlobalWidgetsLocalizations.delegate,
				GlobalCupertinoLocalizations.delegate,
			],
			supportedLocales: [
				const Locale('en'), // English
				const Locale('es'), // Spanish
			],
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (routeSettings) {
        // Redireccion al home cuando no existe la ruta
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage()
        );
      },
//      home: HomePage(),
    );
  }
}
