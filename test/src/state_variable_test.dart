// ignore_for_file: prefer_const_constructors
import 'package:state_variable/state_variable.dart';
import 'package:test/test.dart';

void main() {
  group('StateVariable', () {
    test('can be instantiated', () {
      expect(StateVariable(value: 0), isNotNull);
    });
  });
}
