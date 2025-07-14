import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_geodezyjny_new_version/di/di.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/nav/go_router.dart';
import 'modules/biegunowa/cubit/biegunowa_cubit.dart';
import 'modules/biegunowa/cubit/history_biegunowa_cubit.dart';
import 'modules/ortogonalna/cubit/ortogonalna_cubit.dart';
import 'modules/ortogonalna/cubit/history_ortogonalna_cubit.dart';
import 'modules/wciecie_katowe/cubit/save_wcecie_katowe_cubit.dart';
import 'modules/wciecie_liniowe/cubit/crud_wciecie_liniowe_cubit.dart';
import 'modules/wciecie_liniowe/cubit/wciecie_liniowe_cubit.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HistoryBiegunowaCubit>(
          create: (context) => getIt()),
        BlocProvider<BiegunowaCubit>(
          create: (context) => getIt()),
        BlocProvider<HistoryOrtogonalnaCubit>(
          create: (context) => getIt()),
        BlocProvider<OrtogonalnaCubit>(
          create: (context) => getIt()),
        BlocProvider<HistoryWciecieKatoweCubit>(create: (context) => getIt()), 
        BlocProvider<WciecieKatoweCubit>(create: (context) => getIt()),
        BlocProvider<WciecieLinioweCubit>(create: (context) => getIt()),
        BlocProvider<CrudWciecieLinioweCubit>(create: (context) => getIt()),
      ],
      child: MaterialApp.router(
        title: 'Kalkulator Geodezyjny',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 1, 24, 2),
          useMaterial3: true,
        ),
        routerConfig: Navigation.router,
      ),
    );
  }
}