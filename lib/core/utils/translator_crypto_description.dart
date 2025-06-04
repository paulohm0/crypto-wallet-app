import 'package:translator/translator.dart';

extension TranslatorExtension on String {
  Future<String> translateToPTBR() async {
    final translator = GoogleTranslator();
    final translation = await translator.translate(this, to: 'pt');
    return translation.text;
  }
}
