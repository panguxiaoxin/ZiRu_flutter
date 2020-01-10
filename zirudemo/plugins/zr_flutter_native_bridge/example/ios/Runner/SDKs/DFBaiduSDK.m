//
//  DFBaiduSDK.m
//  Runner
//
//  Created by jinweizhao on 2020/1/9.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "DFBaiduSDK.h"

@implementation DFBaiduSDK

-(void)showUserId:(NSArray *)params{
    if (params.count != 3) {
        NSAssert(params.count != 3, @"参数不合法");
        return;
    }
    self.channel = params.firstObject;
    NSString *para = params[1];
    self.resultCall = params.lastObject;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"原生插件alert" message:para preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [self invokeFlutterMethod:@"saveData" arguments:@"" result:^(id  _Nullable result) {
            self.resultCall(@"点击了确定");
        }];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.resultCall(@"点击了取消");
    }];
    
    [alert addAction: sureAction];
    [alert addAction: cancelAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    
}

@end
