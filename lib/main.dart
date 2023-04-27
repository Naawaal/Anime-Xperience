import 'package:anime_xperience/anime_xperience.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    const AnimeXperience(),
  );
}
