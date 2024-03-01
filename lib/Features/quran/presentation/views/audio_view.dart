import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/quran_audio_player_cubit.dart';
import '../widgets/audio_view_body.dart';

class AudioView extends StatelessWidget {
  const AudioView({super.key, required this.object});
  final Map<String, dynamic> object;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        context.read<AudioPlayerCubit>().stop();
      },
      child: Scaffold(
        body: SafeArea(
          child: AudoViewBody(
            object: object,
          ),
        ),
      ),
    );
  }
}
