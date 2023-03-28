import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import './store/store.dart';
import './router/router.dart';
import 'models/models.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/.env');

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final MobXStore store = MobXStore();

  store.setLoggedIn(AuthService.isLoggedIn());

  runApp(Provider<MobXStore>(
    create: (_) => store,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    store.fetchTransaction(store.userId);
    return MaterialApp.router(
      routerConfig: AppRouter().router,
    );
  }
}
