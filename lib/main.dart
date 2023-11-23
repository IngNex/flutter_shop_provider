import 'package:flutter/material.dart';
import 'package:flutter_apptesis/clean_architecture/data/datasource/api_repository_impl.dart';
import 'package:flutter_apptesis/clean_architecture/data/datasource/local_storage_repository_impl.dart';
import 'package:flutter_apptesis/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_apptesis/clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:flutter_apptesis/ui/provider/home/cart/cart_bloc.dart';
import 'package:flutter_apptesis/ui/provider/main_bloc.dart';
import 'package:flutter_apptesis/ui/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepositoryInterface>(
          create: (_) => ApiRepositoryImpl(),
        ),
        Provider<LocalRepositoryInterface>(
          create: (_) => LocalRepositoryImpl(),
        ),
        ChangeNotifierProvider(create: (context) {
          return MainBloc(
              localRepositoryInterface:
                  context.read<LocalRepositoryInterface>())
            ..loadTheme();
        }),
        ChangeNotifierProvider(create: (_) => CartBloc())
      ],
      child: Builder(
        builder: (newContext) {
          return Consumer<MainBloc>(builder: (context, bloc, _) {
            return bloc.currentTheme == null
                ? const SizedBox.shrink()
                : MaterialApp(
                    title: 'App Tesis',
                    debugShowCheckedModeBanner: false,
                    theme: bloc.currentTheme,
                    //darkTheme: darkTheme,
                    //themeMode: ThemeMode.system,
                    home: SplashScreen.init(context),
                  );
          });
        },
      ),
    );
  }
}
