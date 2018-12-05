//
//  TestCollViewController.h
//  aaa
//
//  Created by 陈磊 on 2018/8/21.
//  Copyright © 2018年 collection. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCollViewController : UIViewController

/**
 当前所处页面
 */
@property (nonatomic,assign) NSInteger currentPage;

/**
 是否隐藏标题头  默认NO
 */
@property (nonatomic,assign) BOOL toolBarHidden;

@end
