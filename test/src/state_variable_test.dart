// ignore_for_file: prefer_const_constructors
import 'package:state_variable/state_variable.dart';
import 'package:test/test.dart';

void main() {
  group('StateVariable', () {
    test('can be instantiated', () {
      const __ = {
        'String': 'anm',
        'value': 1,
        'nullable': null,
        'mapa': {'is': true}
      };
      final mapx = SxMap(
        value: __,
      );
      expect(
        mapx.value,
        __,
      );
    });
  });
}
