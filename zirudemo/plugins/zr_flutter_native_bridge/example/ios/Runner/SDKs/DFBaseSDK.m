//
//  DFBaseSDK.m
//  Runner
//
//  Created by jinweizhao on 2020/1/9.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "DFBaseSDK.h"


@implementation DFBaseSDK

-(void)invokeFlutterMethod:(NSString *)method arguments:(id)arguments result:(FlutterResult)callback{
    [self.channel invokeMethod:method arguments:arguments result:callback];
}

@end
