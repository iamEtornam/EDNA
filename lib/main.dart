import 'package:edna_app/app.dart';
import 'package:edna_app/core/local_storage.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  runApp(const MainApp());
}
