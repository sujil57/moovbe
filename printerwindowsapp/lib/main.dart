import 'dart:io';
import 'package:flutter/material.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:printerwindowsapp/localstorage.dart';
import 'package:provider/provider.dart';
import 'Presentation/Screens/UI/home_page.dart';

void main() async{
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

   launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
  );

  await launchAtStartup.enable();
  //await launchAtStartup.disable();
  // bool isEnabled = await launchAtStartup.isEnabled();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => LocalFiles()),
      ],
      child:
       MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Printer Demo'),
     ),
    );
  }
}
