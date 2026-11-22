package mx.edu.utng.loteriapush.loteria_push

import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(
                NotificationChannel("cartas", "Cartas cantadas", NotificationManager.IMPORTANCE_DEFAULT).apply {
                    description = "Cada carta que canta el cantor"
                }
            )
            manager.createNotificationChannel(
                NotificationChannel("momentos", "Momentos importantes", NotificationManager.IMPORTANCE_HIGH).apply {
                    description = "Avisos de casi y loteria"
                }
            )
        }
    }
}
