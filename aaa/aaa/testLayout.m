//
//  testLayout.m
//  aaa
//
//  Created by 陈磊 on 2018/8/22.
//  Copyright © 2018年 collection. All rights reserved.
//

#import "testLayout.h"
#define TKScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation testLayout
/**
 设置contentsize

 @return collectionview的大小
 */
-(CGSize)collectionViewContentSize
{
    
    if (self.pageWidth) {
        return CGSizeMake(self.pageWidth*self.pageNum+(self.pageNum-1)*self.pageMar,self.pageHeight);
    }else
    {
        return CGSizeMake(TKScreenWidth*self.pageNum+(self.pageNum-1)*self.pageMar, self.pageHeight);
    }
    
}

/**
 判定为布局需要被无效化并重新计算的时候,布局对象会被询问以提供新的布局。

 @param newBounds <#newBounds description#>
 @return <#return value description#>
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
    
}
/**
 返回每个item的布局参数

 @param indexPath <#indexPath description#>
 @return <#return value description#>
 */
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
        
    
    attribute.frame = CGRectMake((self.pageWidth*indexPath.row+self.pageMar*(indexPath.row)), 0, self.pageWidth, self.pageHeight);
        
    
    
    return attribute;
    
}


/**
 返回所有item的布局数组

 @param rect <#rect description#>
 @return <#return value description#>
 */
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int j = 0; j<[self.collectionView numberOfItemsInSection:0]; j++) {
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:j inSection:0];
        //ZKRLog(@"%d--%d",i,j);
        [arr addObject:[self layoutAttributesForItemAtIndexPath:indexpath]];
    }
    
    
    return arr;
}
//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//    
//    CGFloat lastProposedContentOffset = self.currentPage*(self.pageWidth)+self.currentPage*self.pageMar;
//
//    //1. 获取UICollectionView停止的时候的可视范围
//    CGRect rangeFrame;
//
//    rangeFrame.size = self.collectionView.frame.size;
//
//    rangeFrame.origin = proposedContentOffset;
//
//    NSArray *array = [self layoutAttributesForElementsInRect:rangeFrame];
//
//
//
//    //2. 计算在可视范围的距离中心线最近的Item
//    CGFloat minCenterX = CGFLOAT_MAX;
//
//    CGFloat collectionCenterX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
//
//    for (UICollectionViewLayoutAttributes *attrs in array) {
//
//        if(ABS(attrs.center.x - collectionCenterX) < ABS(minCenterX)){
//
//            minCenterX = attrs.center.x - collectionCenterX;
//
//        }
//    }
//
//    //3. 补回ContentOffset，则正好将Item居中显示
//    CGFloat proposedX = proposedContentOffset.x + minCenterX;
//    // 滑动一屏时的偏移量
//    CGFloat mainScreenBounds = self.pageWidth + self.pageMar;
//    // 正向滑动仅滑动一屏
//    if (proposedX - lastProposedContentOffset >= mainScreenBounds) {
//        proposedX = mainScreenBounds + lastProposedContentOffset;
//    }
//    // 反向滑动仅滑动一屏
//    if (proposedX - lastProposedContentOffset <= -mainScreenBounds) {
//        proposedX = -mainScreenBounds + lastProposedContentOffset;
//    }
//
//    lastProposedContentOffset = proposedX;
//
//    CGPoint finialProposedContentOffset = CGPointMake(proposedX, proposedContentOffset.y);
//
//    NSInteger page = 0;
//
//    if (!proposedX) {
//
//        page = 0;
//
//    }else
//    {
//        page = (proposedX+self.pageMar)/(self.pageWidth+self.pageMar);
//    }
//
//    self.currentPage = page;
//    if (self.scrollBlock) {
//        self.scrollBlock(page);
//    }
//    velocity = CGPointMake(0.3, 0);
//    NSLog(@"速度：%@",NSStringFromCGPoint(velocity));
//
//    return finialProposedContentOffset;
//
//
//
//}
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
{
    CGFloat lastProposedContentOffset = self.currentPage*(self.pageWidth)+self.currentPage*self.pageMar;
    
    //1. 获取UICollectionView停止的时候的可视范围
    CGRect rangeFrame;
    
    rangeFrame.size = self.collectionView.frame.size;
    
    rangeFrame.origin = proposedContentOffset;
    
    NSArray *array = [self layoutAttributesForElementsInRect:rangeFrame];
    
    
    
    //2. 计算在可视范围的距离中心线最近的Item
    CGFloat minCenterX = CGFLOAT_MAX;
    
    CGFloat collectionCenterX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        if(ABS(attrs.center.x - collectionCenterX) < ABS(minCenterX)){
            
            minCenterX = attrs.center.x - collectionCenterX;
            
        }
    }
    
    //3. 补回ContentOffset，则正好将Item居中显示
    CGFloat proposedX = proposedContentOffset.x + minCenterX;
    // 滑动一屏时的偏移量
    CGFloat mainScreenBounds = self.pageWidth + self.pageMar;
    // 正向滑动仅滑动一屏
    if (proposedX - lastProposedContentOffset >= mainScreenBounds) {
        proposedX = mainScreenBounds + lastProposedContentOffset;
    }
    // 反向滑动仅滑动一屏
    if (proposedX - lastProposedContentOffset <= -mainScreenBounds) {
        proposedX = -mainScreenBounds + lastProposedContentOffset;
    }
    
    lastProposedContentOffset = proposedX;
    
    CGPoint finialProposedContentOffset = CGPointMake(proposedX, proposedContentOffset.y);
    
    NSInteger page = 0;
    
    if (!proposedX) {
        
        page = 0;
        
    }else
    {
        page = (proposedX+self.pageMar)/(self.pageWidth+self.pageMar);
    }
    
    self.currentPage = page;
    if (self.scrollBlock) {
        self.scrollBlock(page);
    }
   
    
    return finialProposedContentOffset;
}

@end
