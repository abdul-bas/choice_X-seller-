import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AudioPreviewController extends GetxController {
  final AudioPlayer player = AudioPlayer();

  bool loading = false;
  bool playing = false;
  bool idle = true;

  String? currentPath;

  int durationMs = 0;
  int positionMs = 0;

  @override
  void onInit() {
    super.onInit();

    player.onPlayerStateChanged.listen((state) {
      switch (state) {
        case PlayerState.playing:
          playing = true;
          loading = false;
          idle = false;
        case PlayerState.paused:
          playing = false;
          loading = false;
        case PlayerState.completed:
          playing = false;
          loading = false;
          idle = true;
          positionMs = 0;
        case PlayerState.stopped:
          playing = false;
          loading = false;
          idle = true;
        case PlayerState.disposed:
          playing = false;
          loading = false;
          idle = true;
      }
      update();
    });

    player.onDurationChanged.listen((d) {
      durationMs = d.inMilliseconds;
      update();
    });

    player.onPositionChanged.listen((p) {
      positionMs = p.inMilliseconds;
      update();
    });
  }

  Future<void> togglePlay(String? path) async {
    if (path == null) return;
    if (loading) return;

    if (currentPath == path) {
      if (playing) {
        await player.pause();
      } else {
        await player.resume();
      }
    } else {
      await player.stop();

      currentPath = path;
      durationMs = 0;
      positionMs = 0;
      loading = true;
      idle = false;
      update();

      final Source source = kIsWeb ? UrlSource(path) : DeviceFileSource(path);

      await player.play(source);

      final d = await player.getDuration();
      if (d != null && durationMs == 0) {
        durationMs = d.inMilliseconds;
        update();
      }
    }
  }

  Future<void> seekTo(double fraction) async {
    if (durationMs == 0) return;
    final target =
        Duration(milliseconds: (durationMs * fraction.clamp(0.0, 1.0)).round());
    await player.seek(target);
  }

  double get progress {
    if (durationMs == 0) return 0;
    return (positionMs / durationMs).clamp(0.0, 1.0);
  }

  double progressFor(String? path) => path == currentPath ? progress : 0.0;

  bool isLoadingFor(String? path) => path == currentPath && loading;
  bool isPlayingFor(String? path) => path == currentPath && playing;

  String get posLabel => _fmt(Duration(milliseconds: positionMs));
  String get durLabel => _fmt(Duration(milliseconds: durationMs));

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
