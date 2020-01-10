import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zr_flutter_native_bridge/zr_flutter_native_bridge.dart';

void main() {
  const MethodChannel channel = MethodChannel('zr_flutter_native_bridge');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ZrFlutterNativeBridge.platformVersion, '42');
  });
}
