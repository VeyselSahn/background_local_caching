library background_local_caching;

import 'dart:convert';
import 'dart:io';

/// A Calculator.
class BackgroundLocalCaching {
  /// Returns [value] plus 1.

  Future<void> cache({required String fileName, required Map<String, dynamic> content}) async {
    try {
      var _file = File(Directory.systemTemp.path + '/' + fileName + '.txt');
      var _encode = jsonEncode(content);
      await _file.writeAsString(_encode);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getData({required String fileName}) async {
    try {
      var _file = File(Directory.systemTemp.path + '/' + fileName + '.txt');
      var _resString = await _file.readAsString();
      var _decode = jsonDecode(_resString);
      return _decode;
    } catch (e) {
      throw Exception(e);
    }
  }
}
