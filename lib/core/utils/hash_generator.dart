import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:super_hero_app/core/utils/config.dart';

String generateHash() {
  final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
  final bytes = utf8.encode('$timeStamp${Config.privateKey}${Config.publicKey}');
  final digest = md5.convert(bytes);
  final result = 'apikey=${Config.publicKey}&hash=${digest.toString()}&ts=$timeStamp';
  return result;
}