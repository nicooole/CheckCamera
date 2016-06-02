//
//  ViewController.m
//  CheckCamera
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.检测当前的camera是否可用
    if ([self isCameravail]) {
        NSLog(@"当前相机可用");
    } else {
        NSLog(@"当前相机不可用");
    }
    //2.检查当前前置摄像头闪光灯是否可用
    if ([self isCameraFlashavailFront]) {
        NSLog(@"当前前置摄像头闪光灯可用");
    } else {
        NSLog(@"当前前置摄像头闪光灯不可用");
    }
    //3.检查当前后置摄像头闪光是否可用
    if ([self isCameraFlashavailRear]) {
        NSLog(@"当前后置摄像头闪光灯可用");
    } else {
        NSLog(@"当前后置摄像头闪光灯不可用");
    }
    //4.检查当前前置摄像头是否可用
    if ([self isCameraavailFront]) {
        NSLog(@"当前前置摄像头可用");
    } else {
        NSLog(@"当前前置摄像头不可用");
    }
    //5.检查当前后置摄像头是否可用
    if ([self isCameraFlashavailRear]) {
        NSLog(@"当前后置摄像头可用");
    } else {
        NSLog(@"当前后置摄像头不可用");
    }
    //6.检查当前camera支持的媒体类型：image video
    if ([self cameraSupportMedia:(__bridge NSString*)kUTTypeImage]) {
        NSLog(@"支持拍照");
    } else {
        NSLog(@"不支持拍照");
    }
    if ([self cameraSupportMedia:(__bridge NSString*)kUTTypeMovie]) {
        NSLog(@"支持录像");
    } else {
        NSLog(@"不支持录像");
    }
    
}
//相机是否可用
- (BOOL)isCameravail
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
//前置摄像头的闪光灯是否可用
- (BOOL)isCameraFlashavailFront
{
     return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
}
//后置摄像头闪光灯是否可用
- (BOOL)isCameraFlashavailRear
{
    return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
}
//前置摄像头是否可用
- (BOOL)isCameraavailFront
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}
//后置摄像头是否可用
- (BOOL)isCameraavailRear
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}
//
- (BOOL)cameraSupportMedia:(NSString *)paraMediaType
{
    NSArray *avaiableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    for (NSString *item in avaiableMedia) {
        if ([item isEqualToString:paraMediaType]) {
            return true;
        }
    }
    return false;
}
@end
