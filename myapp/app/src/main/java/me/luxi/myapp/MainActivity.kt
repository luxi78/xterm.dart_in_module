package me.luxi.myapp

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Preview
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import me.luxi.myapp.ui.theme.MyAppTheme

class MainActivity : ComponentActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContent {
      MyAppTheme {
        // A surface container using the 'background' color from the theme
        Surface(modifier = Modifier.fillMaxSize(), color = MaterialTheme.colors.background) {
          val context = LocalContext.current
          Box( contentAlignment = Alignment.Center) {
            Button(onClick = {
              ContextCompat.startActivity(
                context,
                FlutterActivity.withCachedEngine("my_engine_id").build(context), null)
            }) {
              Text(text = "start flutter activity")
            }
          }
        }
      }
    }
  }
}