import 'package:flutter/services.dart';

Future<String> getClipboardText() async {
  final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
  String? clipboardText = clipboardData?.text;
  return clipboardText.toString();
}

void copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
