import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Imports local
import 'package:tiktok_clone/config/theme/app_theme.dart';
import 'package:tiktok_clone/presentation/providers/dicover_provider.dart';
import 'package:tiktok_clone/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Se utiliza un [ChangeNotifierProvider] que crea el provider mandando
        /// una funcion buscando al provider que se encuentra en la carpeta de
        /// providers, en este caso retornamos el  [DiscoverProvider()]
        ChangeNotifierProvider(
          /// Nos sirve para decirle a provider que inicialice los metodos desde
          /// que la aplicacion se construye
          lazy: false,
          create: (context) => DiscoverProvider()..loadNextPage(),

          /// Una vez se tenga el metodo loadNextPage(), creado dentro de la clase
          /// provider, podemos llamarlo con un operador de cascada que son los [..nombreDelMetodo]
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TikTok',
        home: const DiscoverScreen(),
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
