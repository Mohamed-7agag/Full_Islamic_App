import 'package:advanced_quran_app/Features/quran/data/models/quran_audio_model/quran_audio_model.dart';
import 'package:flutter/material.dart';
import '../widgets/quran_audio_view_body.dart';

class QuranAudioView extends StatelessWidget {
  const QuranAudioView({super.key, required this.quranAudioModel});
  final QuranAudioModel quranAudioModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: QuranAudioViewBody(
          quranAudioModel: quranAudioModel,
        ),
      ),
    );
  }
}
