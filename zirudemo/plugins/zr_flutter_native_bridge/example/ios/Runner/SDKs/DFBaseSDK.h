//
//  DFBaseSDK.h
//  Runner
//
//  Created by jinweizhao on 2020/1/9.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


@interface DFBaseSDK : NSObject

@property (nonatomic, copy) FlutterResult resultCall;

@property (nonatomic, strong) FlutterMethodChannel *channel;


- (void)invokeFlutterMethod:(NSString*)method arguments:(id _Nullable)arguments result:(FlutterResult _Nullable)callback;

@end

