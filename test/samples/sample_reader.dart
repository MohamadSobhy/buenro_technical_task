import 'dart:io';

String readFileAsString(String filename) {
  return File('test/samples/$filename').readAsStringSync();
}
