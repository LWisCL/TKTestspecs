//
//  testLayout.h
//  aaa
//
//  Created by 陈磊 on 2018/8/22.
//  Copyright © 2018年 collection. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testLayout : UICollectionViewLayout

/**
 控制器之间的间距
 */
@property (nonatomic,assign) CGFloat pageMar;

/**
 页数
 */
@property (nonatomic,assign) NSInteger pageNum;

/**
 页面宽度
 */
@property (nonatomic,assign) CGFloat pageWidth;

/**
 页面高度
 */
@property (nonatomic,assign) CGFloat pageHeight;

/**
 当前所处控制器页数
 */
@property (nonatomic,assign) NSInteger currentPage;
/**
 滑动后所处的位置
 */
@property (nonatomic,copy) void(^scrollBlock)(NSInteger pageNum);

@end
