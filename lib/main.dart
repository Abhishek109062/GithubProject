import 'package:flutter/material.dart';
import 'package:githubproject/pages/home_page.dart';
import 'package:githubproject/routes/routes.dart';


void main(){
  runApp(GitHubApp());
}

class GitHubApp extends StatefulWidget {
  const GitHubApp({super.key});

  @override
  State<GitHubApp> createState() => _GitHubAppState();
}

class _GitHubAppState extends State<GitHubApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}