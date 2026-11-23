

### Inicio

![Inicio de Lotería Push](docs/capturas/app/01_inicio_web.png)

### Partida del jugador

![Tabla del jugador](docs/capturas/app/02_partida_web.png)

### Sala del cantor

![Pantalla del cantor](docs/capturas/app/04_cantor_web.png)

### Carta cantada

![Carta emitida por el servidor](docs/capturas/app/05_carta_cantada_web.png)


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


Si el JDK local no reconoce el certificado de Maven, ejecuta la compilación con `GRADLE_OPTS=-Djavax.net.ssl.trustStoreType=Windows-ROOT`.

## Autor

GitHub: [ValeMolina612](https://github.com/ValeMolina612)
