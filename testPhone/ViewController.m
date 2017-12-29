//
//  ViewController.m
//  testPhone
//
//  Created by Blavtes on 2017/12/29.
//  Copyright © 2017年 Blavtes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableString *str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _str = [NSMutableString new];
    for (int i = 0 ; i< 300; i++) {
       [_str appendString: [self run]];
    }
    
    NSString *filePath = [self getFilePath:@"file.txt"];
    
    NSData *data = [_str dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:filePath atomically:YES];
    NSLog(@"filePath %@",filePath);
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)run
{
    NSMutableString *phone = [NSMutableString stringWithCapacity:1];
    [phone appendString:@"13"];
    for (int i = 0; i < 9; i++) {
        int s = [self random];
        [phone appendString:[NSString stringWithFormat:@"%d",s]];
    }
    [phone appendString:@"\n"];
    NSLog(@"%@",phone);
    return phone;
}

//传入文件名生成文件沙盒路径
- (NSString *)getFilePath:(NSString *)fileName
{
    NSString * documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [documentPath stringByAppendingPathComponent:fileName];
}


- (int)random
{
     int value = (arc4random() % 8) + 1;
    return value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
