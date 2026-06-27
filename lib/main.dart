import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_ecommerce_app/core/di/setup_service_locator.dart';
import 'package:fruits_ecommerce_app/core/routes/routes.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/firebase_options.dart';
import 'package:fruits_ecommerce_app/generated/l10n.dart';
import 'core/routes/generate_routes.dart';
import 'core/helper/my_bloc_observer.dart';
import 'core/services/shared_prefs_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PrefsSingleton.init();
 await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Hub',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      initialRoute: Routes.splashRoute,
      onGenerateRoute: generateRoute,
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
