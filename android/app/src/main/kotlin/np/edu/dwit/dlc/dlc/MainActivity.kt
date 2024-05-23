package com.example.your_app

import io.flutter.embedding.android.FlutterActivity
import com.pichillilorenzo.flutter_inappwebview.InAppWebViewFlutterPlugin

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    InAppWebViewFlutterPlugin.registerWith(flutterEngine)
  }
}
