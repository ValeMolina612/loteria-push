import '../dominio/api_juego.dart';
import '../dominio/puerto_push.dart';

/// Permite ejecutar la app y probar el juego sin credenciales de Firebase.
class PushDesactivado implements PuertoPush {
  const PushDesactivado();

  @override
  Stream<MensajePush> get alAbrirDesdeNotificacion => const Stream.empty();
  @override
  Stream<DestinoPush> get destinoCambiado => const Stream.empty();
  @override
  Stream<MensajePush> get enPrimerPlano => const Stream.empty();
  @override
  Future<PermisoPush> estadoPermiso() async => PermisoPush.denegado;
  @override
  Future<MensajePush?> mensajeInicial() async => null;
  @override
  Future<DestinoPush?> obtenerDestino() async => null;
  @override
  Future<PermisoPush> pedirPermiso() async => PermisoPush.denegado;
  @override
  Future<void> suscribirTema(String tema) async {}
  @override
  Future<void> desuscribirTema(String tema) async {}
}
