import 'package:translator/translator.dart';

extension TranslatorExtension on String {
  Future<String> translateToPTBR() async {
    final blockTranslation = RegExp(
      r'not a supported language|not found|LanguageNotSupportedException',
    );

    if (blockTranslation.hasMatch(this)) {
      return this;
    }

    final translator = GoogleTranslator();
    final translation = await translator.translate(this, to: 'pt');
    return translation.text;
  }
}
