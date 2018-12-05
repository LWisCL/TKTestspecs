//
//  ViewController.m
//  aaa
//
//  Created by 磊陈 on 2017/10/13.
//  Copyright © 2017年 collection. All rights reserved.
//

#import "ViewController.h"
#import "testObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id obj = [[testObject alloc]init];
    SEL sel = @selector(testObjectMethodWith:);
    NSMethodSignature *sig = [obj methodSignatureForSelector:sel];
    NSMethodSignature *sign = [testObject  instanceMethodSignatureForSelector:@selector(testObjectMethodWith:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:self];
    [invocation setSelector:sel];
    [invocation invoke];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)test
{
    NSLog(@"hahah");
}

@end
