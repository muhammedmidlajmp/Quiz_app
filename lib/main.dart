import 'package:artiftioa_solutions_test/controller/quiz_provider/quiz_provider.dart';
import 'package:artiftioa_solutions_test/model/hive_model/hive_model.dart';
import 'package:artiftioa_solutions_test/view/splash_screen/splash.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(HiveModelAdapter().typeId)) {
    Hive.registerAdapter(HiveModelAdapter());
  }
  Hive.openBox<HiveModel>('HiveModel');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF47134F),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
