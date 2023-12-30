part of 'services.exports.dart';

class TextToSpeechService {
  final FlutterTts flutterTts;

  factory TextToSpeechService() => _instance ??= TextToSpeechService._();

  static TextToSpeechService? _instance;
  TextToSpeechService._() : flutterTts = FlutterTts();
  static TextToSpeechService get instance =>
      _instance ??= TextToSpeechService._();

  Future<void> stop() async {
    await flutterTts.stop();
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }
}
