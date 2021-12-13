import 'package:flutter/material.dart';
import 'package:job_portal/providers/job_provider.dart';
import 'Views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
);
