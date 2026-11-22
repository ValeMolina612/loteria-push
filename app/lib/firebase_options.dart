import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Configuracion publica de Firebase.
///
/// Para notificaciones reales, reemplaza estos valores ejecutando
/// `flutterfire configure`. Nunca guardes una cuenta de servicio en la app.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => android,
      TargetPlatform.iOS => ios,
      TargetPlatform.macOS => ios,
      TargetPlatform.windows || TargetPlatform.linux => web,
      TargetPlatform.fuchsia => android,
    };
  }

  static const android = FirebaseOptions(
    apiKey: 'REEMPLAZAR_CON_FLUTTERFIRE_CONFIGURE',
    appId: '1:000000000000:android:loteriapushdemo',
    messagingSenderId: '000000000000',
    projectId: 'loteria-push-demo',
  );

  static const ios = FirebaseOptions(
    apiKey: 'REEMPLAZAR_CON_FLUTTERFIRE_CONFIGURE',
    appId: '1:000000000000:ios:loteriapushdemo',
    messagingSenderId: '000000000000',
    projectId: 'loteria-push-demo',
    iosBundleId: 'mx.edu.utng.loteriapush',
  );

  static const web = FirebaseOptions(
    apiKey: 'REEMPLAZAR_CON_FLUTTERFIRE_CONFIGURE',
    appId: '1:000000000000:web:loteriapushdemo',
    messagingSenderId: '000000000000',
    projectId: 'loteria-push-demo',
  );
}
