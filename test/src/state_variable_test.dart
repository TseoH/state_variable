// ignore_for_file: prefer_const_constructors
import 'package:equatable/equatable.dart';
import 'package:state_variable/state_variable.dart';
import 'package:test/test.dart';

class TestClass extends Equatable {
  const TestClass({
    required this.value,
    required this.isTest,
  });

  factory TestClass.fromJson(Map<String, dynamic> json) {
    return TestClass(
      value: json['value'] as String,
      isTest: json['isTest'] as bool,
    );
  }

  final String value;
  final bool isTest;

  Map<String, dynamic> toJson() {
    final data = {
      'value': value,
      'isTest': isTest,
    };
    return data;
  }

  @override
  List<Object> get props => [value, isTest];

  @override
  String toString() {
    return 'TestClass{value: $value, isTest: $isTest}';
  }
}

void main() {
  group('StateVariable', () {
    test('can be instantiated', () {
      const mockTextClass = TestClass(value: 'Test', isTest: true);
      final sv = Sx<TestClass>(
        value: mockTextClass,
      )..toInitial();
      expect(
        sv.value,
        mockTextClass,
      );
    });
    test('Status Change', () {
      const mockTextClass = TestClass(value: 'Test', isTest: true);
      final sv = Sx(value: mockTextClass).toLoading();
      expect(sv.toFailed().isFailed, true);
    });

    test('SxDouble', () {
      final svDouble = SxDouble(value: 10.5);
      expect(svDouble.value, 10.5);
    });

    test('SxInt', () {
      final svInt = SxInt(value: 105);
      expect(svInt.value, 105);
    });

    test('SxString', () {
      final svString = SxString(value: 'Text');
      expect(svString.value, 'Text');
    });
  });

  group('Equality', () {
    test('Equality with == operator', () {
      final one = SxInt(value: 0);
      final two = SxInt(value: 0);
      expect(one == two, true);
    });
    test('Equality with != operator', () {
      const mockTextClass = TestClass(value: 'Test', isTest: true);
      const mockTextClass2 = TestClass(value: 'Test1', isTest: true);
      final value1 = Sx<TestClass>(value: mockTextClass);
      final value2 = Sx<TestClass>(value: mockTextClass2);
      expect(value1 != value2, true);
    });
  });
}
