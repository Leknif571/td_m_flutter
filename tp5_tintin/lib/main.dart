import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp5_tintin/page/home_tintin.dart';
import 'package:tp5_tintin/providers/reading_list_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ReadingListProvider(), child: const MyApp()));
}
