//
//  UIView+TKExtension.h
//  泰行销
//
//  Created by LQMacBookPro on 17/4/27.
//  Copyright © 2017年 taikanglife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TKExtension)
/**
 *	@getter	获取控件center的x值
 *  @setter 保持控件bounds值和center的y值只改变center的x值，并将新center赋值给原控件
 */


//@property (nonatomic, assign) CGFloat x;
//@property (nonatomic, assign) CGFloat y;
//@property (nonatomic, assign) CGFloat width;
//@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
//@property (nonatomic, assign) CGFloat centerX;
//@property (nonatomic, assign) CGFloat centerY;
//@property (nonatomic, assign) CGSize size;


@property (nonatomic, assign)CGFloat centerX;
/**
 *	@getter	获取控件center的y值
 *  @setter 保持控件bounds值和center的y值只改变center的x值，并将新center赋值给原控件
 */

@property (nonatomic, assign)CGFloat centerY;
/**
 *	@getter	获取控件的尺寸
 *  @setter 保持控件bounds值和center的y值只改变center的x值，并将新center赋值给原控件
 */

@property (nonatomic, assign)CGSize size;


- (CGPoint)bottomPoint:(UIView *)view;
- (CGPoint)rightPoint:(UIView *)view;
- (CGPoint)leftPoint:(UIView *)view;
- (CGPoint)topPoint:(UIView * )view;


/**
 *	@getter	获取控件纵坐标最小值
 *  @setter 保持控件frame其他的值不变只改变x值，并将新frame赋值给原控件
 */

@property (nonatomic, assign)CGFloat x;
/**
 *	@getter	获取控件纵坐标最小值
 *  @setter 保持控件frame其他的值不变只改变y值，并将新frame赋值给原控件
 */

@property (nonatomic, assign)CGFloat y;
/**
 *	@getter	获取控件宽度
 *  @setter 保持控件frame其他的值不变只改变width值，并将新frame赋值给原控件
 */

@property (nonatomic, assign)CGFloat width;
/**
 *	@getter	获取控件高度
 *  @setter 保持控件frame其他的值不变只改变height值，并将新frame赋值给原控件
 */
@property (nonatomic, assign)CGFloat height;




/**
 *	@return	获取控件横坐标最大值
 */
- (CGFloat)right;

/**
 *	@return	获取控件纵坐标最大值
 */

- (CGFloat)bottom;

@end
