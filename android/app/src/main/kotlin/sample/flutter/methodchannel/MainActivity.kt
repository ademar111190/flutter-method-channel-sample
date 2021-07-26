package sample.flutter.methodchannel

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "sample.flutter/platform")
        channel.setMethodCallHandler { call, result ->
            if ("platformName" == call.method) {
                result.success("Android")
            } else {
                result.notImplemented()
            }
        }
    }
}
