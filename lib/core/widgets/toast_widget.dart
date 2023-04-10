import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showToast(String text) {
  BotToast.showText(text: text, align: Alignment.bottomCenter);
}
