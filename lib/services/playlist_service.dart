import 'package:on_audio_query/on_audio_query.dart' as on_audio;
import 'package:flutter/foundation.dart';
import '../models/song_model.dart';

class PlaylistService {
  final on_audio.OnAudioQuery _audioQuery = on_audio.OnAudioQuery();

  Future<List<SongModel>> getAllSongs() async {
    try {
      if (kIsWeb) return _getSampleSongs();

      final List<on_audio.SongModel> queryResult = await _audioQuery.querySongs(
        sortType: on_audio.SongSortType.TITLE,
        orderType: on_audio.OrderType.ASC_OR_SMALLER,
        uriType: on_audio.UriType.EXTERNAL,
        ignoreCase: true,
      );

      // Nếu máy trống (chưa có nhạc hoặc Media Store chưa quét xong), hiện nhạc mẫu
      if (queryResult.isEmpty) {
        return _getSampleSongs();
      }

      return queryResult.map((audio) => SongModel.fromAudioQuery(audio)).toList();
    } catch (e) {
      return _getSampleSongs();
    }
  }

  List<SongModel> _getSampleSongs() {
    return [
      SongModel(
        id: 'sample_1',
        title: 'Sample Song 1',
        artist: 'Creative Commons',
        album: 'Test Album',
        filePath: 'assets/audio/sample_songs/song1.mp3',
        duration: const Duration(minutes: 3, seconds: 45),
      ),
      SongModel(
        id: 'sample_2',
        title: 'Sample Song 2',
        artist: 'Bensound',
        album: 'Test Album',
        filePath: 'assets/audio/sample_songs/song2.mp3',
        duration: const Duration(minutes: 4, seconds: 20),
      ),
    ];
  }

  Future<List<SongModel>> searchSongs(String query) async {
    final allSongs = await getAllSongs();
    final lowerQuery = query.toLowerCase();
    return allSongs.where((song) {
      return song.title.toLowerCase().contains(lowerQuery) ||
          song.artist.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
