//draft file

import 'dart:developer' show log;
import 'package:state_variable/src/helpers/helpers.dart';
import 'package:state_variable/src/src.dart';
import 'state_variable_test.dart';

const testElements = [
  mockTextClass,
  mockTextClass2,
];
void main() {
  var mapped = const <String, dynamic>{};
  //Test Sx toJson method with encoder
  const value = Sx(
    value: <TestClass>[
      mockTextClass,
      mockTextClass2,
    ],
  );
  mapped = value.toJson(
    encoder: (value) {
      return value.map((e) => e.toJson()).toList();
    },
  );
  print('$mapped\n');

  //Test Sx fromJson method with decoder
  final value1 = Sx.fromJson(
    mapped,
    decoder: (value) {
      return (value as List<JsonMap>).map(TestClass.fromJson).toList();
    },
  );

  print('$value1\n');

  const value3 = SxList(value: testElements);
  final mappedWithoutEncoder3 = value3.toJson();

  print('$mappedWithoutEncoder3\n');
  final mappedWithEncoder3 = value3.toJson(encoder: (value) {
    return value.map((e) => e.toJson()).toList();
  });

  print('$mappedWithEncoder3\n');

  final value4 = SxMap(value: {'element': testElements.first});
  print(value4.toJson(encoder: (encoder) {
    return encoder.map((key, value) => MapEntry(key, value.toJson()));
  }));
}
