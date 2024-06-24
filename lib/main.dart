import 'package:adminfeature/features/employeefeature/presentation/bloc/emp_cubit.dart';
import 'package:adminfeature/features/employeefeature/presentation/pages/emp_page.dart';
import 'package:adminfeature/features/stafffeature/presentation/bloc/staff_cubit.dart';
import 'package:adminfeature/features/stafffeature/presentation/pages/staff_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/theme_data/colors.dart';
import 'core/theme_data/theme_mode.dart';
import 'core/theme_data/theme_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();
  @override
  void initState() {
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<EmpCubit>()),
        BlocProvider(create: (context) => di.sl<StaffCubit>()),
      ],
      child: ChangeNotifierProvider(
        create: (_) => themeProvider,
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) => MaterialApp(
            title: "Activity Tracker",
            builder: (BuildContext context, widget) {
              AppColors().darkTheme = value.isDarkTheme;
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(
                    1.0,
                  ),
                ),
                child: widget!,
              );
            },
            debugShowCheckedModeBanner: false,
            themeMode: value.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme(value),
            darkTheme: AppTheme.darkTheme(value),
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EmpPage(),
                ),
              );
            },
            child: const Text(
              'Employee',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StaffPage(),
                ),
              );
            },
            child: const Text(
              'Staff',
            ),
          ),
        ],
      ),
    );
  }
}
