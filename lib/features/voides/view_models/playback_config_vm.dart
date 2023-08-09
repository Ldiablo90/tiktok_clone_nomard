import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/features/voides/models/playback_config_model.dart';
import 'package:tiktok_clone/features/voides/repos/video_playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  VideoPlaybackConfigRepository _repository;

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlaybackConfigModel(
      muted: value,
      autoplay: state.autoplay,
    );
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }

  @override
  PlaybackConfigModel build() {
    // TODO: implement build
    return PlaybackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }
}

final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
  () => throw UnimplementedError(),
);
// Provider 방식
// class PlaybackConfigViewModel extends ChangeNotifier {
//   VideoPlaybackConfigRepository _repository;

//   late final PlaybackConfigModel _model = PlaybackConfigModel(
//     muted: _repository.isMuted(),
//     autoplay: _repository.isAutoplay(),
//   );

//   PlaybackConfigViewModel(this._repository);

//   void setMuted(bool value) {
//     _repository.setMuted(value);
//     _model.muted = value;
//     notifyListeners();
//   }

//   void setAutoplay(bool value) {
//     _repository.setAutoplay(value);
//     _model.autoplay = value;
//     notifyListeners();
//   }

//   bool get muted => _model.muted;
//   bool get autoplay => _model.autoplay;
// }
