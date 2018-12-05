//
//  testObject.m
//  aaa
//
//  Created by 陈磊 on 2018/7/9.
//  Copyright © 2018年 collection. All rights reserved.
//

#import "testObject.h"

@implementation testObject
-(void)testObjectMethodWith:(int)a
{
    NSLog(@"%s",__func__);
}
+(void)testClassMethodWith:(int)b
{
    NSLog(@"%s",__func__);
}
@end
