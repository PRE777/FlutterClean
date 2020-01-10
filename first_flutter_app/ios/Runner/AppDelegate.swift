import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller:FlutterViewController = self.window.rootViewController as! FlutterViewController;
    
    let batteryChannel = FlutterMethodChannel.init(name: "samples.flutter.io/battery", binaryMessenger: controller as! FlutterBinaryMessenger);
    batteryChannel.setMethodCallHandler { (call:FlutterMethodCall, result:FlutterResult) in
        if("getBatteryLevel" == call.method){
            let batteryLevel:Int = getBatteryLabel();
            if batteryLevel == -1 {
                result(FlutterError.init(code: "UNAVAILABLE", message: "电池信息不可用", details: nil));
            } else {
                result(batteryLevel);
            }
        }else{
            result(FlutterMethodNotImplemented);
        }
    };
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

func getBatteryLabel() -> Int{
    let device:UIDevice = UIDevice.current;
    device.isBatteryMonitoringEnabled = true;
    if device.batteryState == UIDeviceBatteryState.unknown {
        return -1;
    }else {
        return Int(device.batteryLevel * 100);
    }
}
