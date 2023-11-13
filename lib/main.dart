import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microclimat_monitoring_app/app/injection/injection_container.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_five_cubit/cubit/sensor_five_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_four_cubit/cubit/sensor_four_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_one_cubit/cubit/sensor_one_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_three_cubit/cubit/sensor_three_cubit.dart';
import 'package:microclimat_monitoring_app/cubits/sensor_two_cubit/cubit/sensor_two_cubit.dart';
import 'package:microclimat_monitoring_app/firebase_options.dart';
import 'package:microclimat_monitoring_app/features/home_page/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SensorOneCubit>()..start(),
        ),
        BlocProvider(
          create: (context) => getIt<SensorTwoCubit>()..start(),
        ),
        BlocProvider(
          create: (context) => getIt<SensorThreeCubit>()..start(),
        ),
        BlocProvider(
          create: (context) => getIt<SensorFourCubit>()..start(),
        ),
        BlocProvider(
          create: (context) => getIt<SensorFiveCubit>()..start(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
