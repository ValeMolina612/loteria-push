import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_push/dominio/almacen.dart';
import 'package:loteria_push/dominio/controlador.dart';
import 'package:loteria_push/presentacion/pantalla_cantor.dart';
import 'package:loteria_push/presentacion/pantalla_inicio.dart';
import 'package:loteria_push/presentacion/pantalla_juego.dart';
import 'package:loteria_push/presentacion/vms.dart';

import 'falsos.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> preparar(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  testWidgets('captura inicio', (tester) async {
    await preparar(tester);
    final api = ApiFalsa();
    final vm = JuegoVm(ControladorPartida(api: api, push: PuertoPushFalso(), almacen: AlmacenMemoria()));
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: PantallaInicio(vm: vm, crearCantor: () => CantorVm(api)),
    ));
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/01_inicio.png'));
    vm.dispose();
  });

  testWidgets('captura partida esperando', (tester) async {
    await preparar(tester);
    final api = ApiFalsa();
    final controlador = ControladorPartida(api: api, push: PuertoPushFalso(), almacen: AlmacenMemoria());
    await controlador.unirse(sala: 'ABCDE', nombre: 'Ana');
    final vm = JuegoVm(controlador);
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: PantallaJuego(vm: vm),
    ));
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/02_partida.png'));
    vm.dispose();
  });

  testWidgets('captura ganador', (tester) async {
    await preparar(tester);
    final api = ApiFalsa();
    final controlador = ControladorPartida(api: api, push: PuertoPushFalso(), almacen: AlmacenMemoria());
    await controlador.unirse(sala: 'ABCDE', nombre: 'Ana');
    api
      ..cartasServidor.addAll([carta(1, 1), carta(2, 2), carta(3, 3), carta(4, 4)])
      ..ganadorServidor = 'Ana'
      ..patronServidor = 'fila1';
    await controlador.sincronizar();
    final vm = JuegoVm(controlador);
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: PantallaJuego(vm: vm),
    ));
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/03_ganador.png'));
    vm.dispose();
  });

  testWidgets('captura cantor', (tester) async {
    await preparar(tester);
    final vm = CantorVm(ApiFalsa());
    await vm.crear();
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: PantallaCantor(vm: vm),
    ));
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/04_cantor.png'));
  });
}
