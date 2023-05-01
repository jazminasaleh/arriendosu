import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Home page', () {
    final appbatTextFind = find.byValueKey('bienvenido');

    FlutterDriver driver = FlutterDriver.connectedTo();

    //*se hace la conexion
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Evaluar que si este el titulo de bienvenida', () async {
      expect(await driver.getText(appbatTextFind), "Bienvenido");
    });
  });

  group('Publicaciones page', () {
    final appbatTextFind = find.byValueKey('Cl.38a#11-79');

    FlutterDriver driver = FlutterDriver.connectedTo();

    //*se hace la conexion
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Evaluar de que si se haya integrado la base de datos con el front', () async {
      expect(await driver.getText(appbatTextFind), "Jazmin Andrea");
    });
  });
}
