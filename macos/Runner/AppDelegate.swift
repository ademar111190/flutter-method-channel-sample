import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationDidFinishLaunching(
    _ notification: Notification
  ) {
    let controller : FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
    let channel = FlutterMethodChannel.init(
      name: "sample.flutter/platform",
      binaryMessenger: controller.engine.binaryMessenger
    )
    channel.setMethodCallHandler({
      (_ call: FlutterMethodCall, _ result: FlutterResult) -> Void in
      if ("platformName" == call.method) {
        result("MacOS")
      }
      result(FlutterMethodNotImplemented)
    });
  }

  override func applicationShouldTerminateAfterLastWindowClosed(
    _ sender: NSApplication
  ) -> Bool {
    return true
  }
}
