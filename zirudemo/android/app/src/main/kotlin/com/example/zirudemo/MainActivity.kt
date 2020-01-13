package com.example.zirudemo

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.webviewflutter.WebViewFlutterPlugin;
class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(io.flutter.plugins.webviewflutter.WebViewFlutterPlugin())
        GeneratedPluginRegistrant.registerWith(flutterEngine);



    }
}
