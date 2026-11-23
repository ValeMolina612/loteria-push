# Lotería Push

Aplicación Flutter y servidor Node para jugar Lotería mexicana en tiempo real. El servidor es la fuente de verdad, canta las cartas, valida las líneas y prepara notificaciones Firebase Cloud Messaging para la sala, avisos personales de “Casi” y el anuncio de “Lotería”.

Proyecto elaborado a partir del manual TDD de UTNG. Incluye 54 cartas, 12 patrones de victoria, autorización del cantor y del jugador, tolerancia a mensajes repetidos o desordenados, TTL, colapso, limpieza de destinos muertos y modo local sin credenciales Firebase.

## Resultado

| Componente | Estado |
|---|---|
| Servidor Node | 61 pruebas verdes |
| App Flutter | 56 pruebas verdes, incluidas 4 capturas |
| Análisis estático | Sin problemas |
| Android | APK debug compilado e instalado en `medium_phone` |
| Web local | Flujo jugador y cantor verificado contra el servidor |
| Firebase real | Preparado; requiere ejecutar `flutterfire configure` con un proyecto propio |

## Pantallas

### Inicio

![Inicio de Lotería Push](docs/capturas/app/01_inicio_web.png)

### Partida del jugador

![Tabla del jugador](docs/capturas/app/02_partida_web.png)

### Sala del cantor

![Pantalla del cantor](docs/capturas/app/04_cantor_web.png)

### Carta cantada

![Carta emitida por el servidor](docs/capturas/app/05_carta_cantada_web.png)

## Estructura

```text
loteria_push/
├─ app/                    Flutter
│  ├─ lib/dominio/         reglas, eventos, sesión y puertos
│  ├─ lib/infra/           HTTP, Firebase, almacenamiento y canales
│  ├─ lib/presentacion/    pantallas y ViewModels
│  ├─ test/                dominio, controlador, widgets y capturas
│  ├─ android/             proyecto Android y canales nativos
│  ├─ web/                 destino web
│  └─ windows/             destino Windows
├─ server/                 Node 20+
│  ├─ test/                61 pruebas con node:test
│  ├─ baraja.js            54 cartas y mezcla Fisher-Yates
│  ├─ lineas.js            patrones de Lotería
│  ├─ mensajes.js          payloads FCM
│  ├─ sala.js              reglas y autorización
│  ├─ enviador.js          adaptador Firebase Admin
│  └─ servidor.js          API HTTP
└─ docs/capturas/          evidencias de app y ciclos TDD
```

## Ejecución local

### Servidor

```powershell
cd server
npm test
npm start
```

El servidor queda en `http://localhost:8080` y simula los push en consola. No requiere instalar dependencias para las pruebas.

### App sin Firebase

```powershell
cd app
flutter pub get
flutter test
flutter run -d emulator-5554 `
  --dart-define=SERVIDOR=http://10.0.2.2:8080 `
  --dart-define=FIREBASE_ACTIVO=false
```

En un teléfono real, sustituye `10.0.2.2` por la IP de la computadora en la misma red.

### App web

```powershell
flutter run -d chrome `
  --dart-define=SERVIDOR=http://localhost:8080 `
  --dart-define=FIREBASE_ACTIVO=false
```

El servidor incluye CORS para el desarrollo web local.

## Activar Firebase Cloud Messaging

1. Crea un proyecto en Firebase.
2. Instala Firebase CLI y FlutterFire CLI.
3. Desde `app/`, ejecuta `flutterfire configure` para reemplazar `lib/firebase_options.dart`.
4. Activa `FIREBASE_ACTIVO=true` al ejecutar la app.
5. Para envíos reales, instala `firebase-admin` en `server/` y configura `GOOGLE_APPLICATION_CREDENTIALS` fuera del repositorio.
6. Inicia con `FCM_REAL=1`; usa primero `FCM_DRY_RUN=1` para validar los mensajes sin entregarlos.

Nunca subas el JSON de una cuenta de servicio. El `.gitignore` excluye llaves, archivos `.env`, `google-services.json` y `GoogleService-Info.plist`.

## API

| Método | Ruta | Uso |
|---|---|---|
| POST | `/salas` | Crear sala y clave del cantor |
| POST | `/salas/:id/jugadores` | Unirse y recibir tabla y clave |
| GET | `/salas/:id/estado?desde=n` | Sincronizar cartas y ganador |
| POST | `/salas/:id/cantar` | Cantar con `x-cantor-clave` |
| PUT | `/salas/:id/jugadores/:nombre/destino` | Actualizar token o FID |
| POST | `/salas/:id/loteria` | Reclamar y validar Lotería |

## Ciclos TDD del manual

Todas las imágenes siguientes son capturas reales de Visual Studio Code durante la ejecución del proyecto. Incluyen el logotipo de Lotería Push y el usuario de GitHub `ValeMolina612`. Las rondas 2 a 9 documentan ambos pasos del ciclo TDD: primero la prueba roja con la implementación ausente o incompleta y después la misma prueba en verde. Las rondas 0, 1 y 10 a 12 son verificaciones de preparación, dispositivo, seguridad y evolución definidas por el manual, por lo que se documentan con su evidencia ejecutada sin inventar un ciclo rojo/verde.

### Ronda 0 Reglas del juego

![Ronda 0, pruebas reales de las reglas](docs/capturas/tdd-real/ronda_00_evidencia_real.png)

### Ronda 1 Preparación y configuración

![Ronda 1, comprobación real del entorno](docs/capturas/tdd-real/ronda_01_evidencia_real.png)

### Ronda 2 Baraja y líneas

| Rojo | Verde |
|---|---|
| ![Ronda 2 roja real](docs/capturas/tdd-real/ronda_02_rojo_real.png) | ![Ronda 2 verde real](docs/capturas/tdd-real/ronda_02_verde_real.png) |

### Ronda 3 Mensajes push

| Rojo | Verde |
|---|---|
| ![Ronda 3 roja real](docs/capturas/tdd-real/ronda_03_rojo_real.png) | ![Ronda 3 verde real](docs/capturas/tdd-real/ronda_03_verde_real.png) |

### Ronda 4 Sala y autorización

| Rojo | Verde |
|---|---|
| ![Ronda 4 roja real](docs/capturas/tdd-real/ronda_04_rojo_real.png) | ![Ronda 4 verde real](docs/capturas/tdd-real/ronda_04_verde_real.png) |

### Ronda 5 API y envío seguro

| Rojo | Verde |
|---|---|
| ![Ronda 5 roja real](docs/capturas/tdd-real/ronda_05_rojo_real.png) | ![Ronda 5 verde real](docs/capturas/tdd-real/ronda_05_verde_real.png) |

### Ronda 6 Eventos y partida Flutter

| Rojo | Verde |
|---|---|
| ![Ronda 6 roja real](docs/capturas/tdd-real/ronda_06_rojo_real.png) | ![Ronda 6 verde real](docs/capturas/tdd-real/ronda_06_verde_real.png) |

### Ronda 7 Controlador

| Rojo | Verde |
|---|---|
| ![Ronda 7 roja real](docs/capturas/tdd-real/ronda_07_rojo_real.png) | ![Ronda 7 verde real](docs/capturas/tdd-real/ronda_07_verde_real.png) |

### Ronda 8 Firebase y estados de la app

| Rojo | Verde |
|---|---|
| ![Ronda 8 roja real](docs/capturas/tdd-real/ronda_08_rojo_real.png) | ![Ronda 8 verde real](docs/capturas/tdd-real/ronda_08_verde_real.png) |

### Ronda 9 Pantallas y arranque

| Rojo | Verde |
|---|---|
| ![Ronda 9 roja real](docs/capturas/tdd-real/ronda_09_rojo_real.png) | ![Ronda 9 verde real](docs/capturas/tdd-real/ronda_09_verde_real.png) |

### Ronda 10 Dispositivos reales

Lista manual: primer plano, segundo plano, app cerrada, colapso, TTL, ganador, “Casi”, permiso rechazado, token muerto y detención forzada. La entrega real exige credenciales Firebase y, para iOS, APNs y un dispositivo Apple.

![Ronda 10, evidencia real de compilación y dispositivos](docs/capturas/tdd-real/ronda_10_evidencia_real.png)

### Ronda 11 Seguridad

Los temas solo llevan datos públicos; el servidor valida todas las acciones; las claves de servicio quedan fuera de la app; los destinos push se tratan como datos personales; existen límites de sala, cuerpo y frecuencia de canto.

![Ronda 11, pruebas reales de seguridad](docs/capturas/tdd-real/ronda_11_evidencia_real.png)

### Ronda 12 Tokens y FID

`PuertoPush` aísla el SDK. El servidor acepta destinos `token` y `fid`. El adaptador actual conserva el camino por token para compatibilidad y deja la migración a `register`, `onRegistered` y `unregister` concentrada en un único archivo.

![Ronda 12, pruebas reales de tokens y FID](docs/capturas/tdd-real/ronda_12_evidencia_real.png)

## Comandos de verificación

```powershell
cd server
npm test

cd ../app
flutter test
flutter analyze
flutter build apk --debug `
  --dart-define=SERVIDOR=http://10.0.2.2:8080 `
  --dart-define=FIREBASE_ACTIVO=false
```

Si el JDK local no reconoce el certificado de Maven, ejecuta la compilación con `GRADLE_OPTS=-Djavax.net.ssl.trustStoreType=Windows-ROOT`.

## Autor

GitHub: [ValeMolina612](https://github.com/ValeMolina612)
