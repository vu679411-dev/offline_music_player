import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/audio_provider.dart';
import 'providers/playlist_provider.dart';
import 'providers/theme_provider.dart';
import 'services/audio_player_service.dart';
import 'services/storage_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AudioPlayerService()),
        Provider(create: (_) => StorageService()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProxyProvider2<AudioPlayerService, StorageService, AudioProvider>(
          create: (context) => AudioProvider(
            context.read<AudioPlayerService>(),
            context.read<StorageService>(),
          ),
          update: (context, audioService, storageService, previous) =>
              previous ?? AudioProvider(audioService, storageService),
        ),
        ChangeNotifierProxyProvider<StorageService, PlaylistProvider>(
          create: (context) => PlaylistProvider(context.read<StorageService>()),
          update: (context, storage, previous) => previous ?? PlaylistProvider(storage),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Offline Music Player',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
              primaryColor: themeProvider.primaryColor,
              scaffoldBackgroundColor: themeProvider.isDarkMode ? const Color(0xFF191414) : Colors.white,
              colorScheme: ColorScheme.fromSeed(
                seedColor: themeProvider.primaryColor,
                brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
              ),
              useMaterial3: true,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
