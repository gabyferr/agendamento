import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/usuarioPage');
    return MaterialApp.router(
      title: 'App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue.shade800,
      ),
      locale: Locale('pt_BR'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.unknown,
        PointerDeviceKind.stylus
      };
}
