#import "ZrFlutterNativeBridgePlugin.h"
static FlutterMethodChannel *zrFlutterNativeBridgePluginChannel;
@implementation ZrFlutterNativeBridgePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"zr_flutter_native_bridge"
                                     binaryMessenger:[registrar messenger]];
    ZrFlutterNativeBridgePlugin* instance = [[ZrFlutterNativeBridgePlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    zrFlutterNativeBridgePluginChannel = channel;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    
    NSArray *argums = (NSArray *)call.arguments;
    
    if ([call.method isEqualToString:@"startSDK"]) {
        
        if (argums.count == 3) {
            
            NSString *className = argums.firstObject;
            
            NSString *methodName = argums[1];
            
            Class TempClass = NSClassFromString(className);
            
            id temp = [[TempClass alloc]init];
            
            [temp performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@:",methodName]) withObject:@[zrFlutterNativeBridgePluginChannel,argums.lastObject,result]];
            
        }
        
    }else if ([call.method isEqualToString:@"startSynSDK"]) {
        
        
        
    }else if ([call.method isEqualToString:@"getPlatformVersion"]){
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
    
}

@end
