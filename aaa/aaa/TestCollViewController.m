//
//  TestCollViewController.m
//  aaa
//
//  Created by 陈磊 on 2018/8/21.
//  Copyright © 2018年 collection. All rights reserved.
//

#import "TestCollViewController.h"

//#import "TKSelfAdaptationBar.h"
//#import "UIView+TKExtension.h"
//#import "testLayout.h"
#define TKScreenSize [UIScreen mainScreen].bounds
#define TKScreenScale [UIScreen mainScreen].scale
#define TKScreenWidth [UIScreen mainScreen].bounds.size.width
#define TKScreenHeight [UIScreen mainScreen].bounds.size.height
#define TKKeywindow [UIApplication sharedApplication].keyWindow

#define mar 10
@interface TestCollViewController ()
@property (nonatomic,strong) NSMutableArray *arr;
//@property (nonatomic,strong) UICollectionView *coll;
//
//@property (nonatomic,strong) TKSelfAdaptationBar *bar;
//
//@property (nonatomic,strong) NSArray *keyArray;

@end

@implementation TestCollViewController
//static NSString * const reuseIdentifier = @"ProposalCollectionCell";
//-(NSArray *)keyArray
//{
//    if (_keyArray == nil) {
//        _keyArray = @[@"A控制器",@"B控制器",@"C控制器",@"D控制器"];
//    }
//    return _keyArray;
//}
//-(TKSelfAdaptationBar *)bar
//{
//    if (_bar == nil) {
//        TKSelfAdaptationBar *bar = [[TKSelfAdaptationBar alloc]init];
//        bar.minCount = 4;
//        bar.keyArray = @[@"A控制器",@"B控制器",@"C控制器",@"D控制器"];
//        __weak typeof(self) weakSelf = self;
//        bar.clickButtonBlock = ^(NSInteger index) {
//
//            weakSelf.currentPage = index;
//
//            testLayout *layout = (testLayout *)weakSelf.coll.collectionViewLayout;
//
//            layout.currentPage = index;
//
//            [weakSelf.coll setContentOffset:CGPointMake(TKScreenWidth*index+(index)*mar, 0) animated:NO];
//
//        };
//        [self.view addSubview:bar];
//        _bar  = bar;
//    }
//    return _bar;
//}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.arr = [NSMutableArray array];
    
    [self sendMessage];
    
//    [self sendMessage:100];
    
    
}

- (void)sendMessage {
    
    
    NSString *a = @"123456123";
    
    [self getStr:a];
    
}
-(void)getStr:(NSString *)str
{
    NSString *string = @"";
//    NSMutableArray *arr = [NSMutableArray array];
    for (int k = 0; k<str.length; k++) {
        for (int i = k ; i<str.length; i++) {
            
            NSString *singleStr = [str substringWithRange:NSMakeRange(i, 1)];
            
            if (string.length == 0) {
                string = singleStr;
            }else
            {
                
                BOOL haveSame = [string containsString:singleStr];
                if (!haveSame) {
                    string  = [string stringByAppendingString:singleStr];
                    
                }else
                {
                    [self insertStr:string ToArr:self.arr];
                    string = @"";
                    break;
                }
                
                
            }
            if (i == str.length-1) {
                [self insertStr:string ToArr:self.arr];
                string = @"";
                break;
            }
            
        }
    }
    
    NSLog(@"%@",self.arr);
}
//快速排序
-(void)insertStr:(NSString *)str ToArr:(NSMutableArray *)arr
{
    
    if (!arr.count) {
        [arr addObject:str];
        return;
    }
    
    for (NSInteger i = arr.count-1; i>= 0; i--) {
        
        NSString *string = arr[i];
        
        if (i == 0) {
            if (str.length>=string.length) {
                [arr insertObject:str atIndex:0];
            }else
            {
                [arr insertObject:str atIndex:1];
            }
        }else
        {
            if (str.length<string.length) {
                
                [arr insertObject:str atIndex:i+1];
                
                break;
                
            }
        }
        
        
        
        
        
    }
    
    
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self sendMessage];
//}
//- (void)sendMessage:(NSInteger)messageCount {
//
//    NSLog(@"Message: %ld", messageCount);
//}


//-(void)setSubViews
//{
//
//    self.bar.frame = CGRectMake(0, 64,self.view.frame.size.width , 40);
//
////    float tileSize = (self.view.width - 10 - kTileSpace * kTileInLine) / kTileInLine;
//
//    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.itemSize = CGSizeMake(TKScreenWidth,self.view.frame.size.height - (self.bar.frame.size.height+self.bar.frame.origin.y));
//    layout.minimumLineSpacing = mar;
//    layout.minimumInteritemSpacing = 0;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
////    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
//
//    testLayout *lay = [[testLayout alloc]init];
//
//    lay.pageHeight = self.view.frame.size.height - (self.bar.frame.size.height+self.bar.frame.origin.y);
//
//    lay.pageNum = self.childViewControllers.count;
//
//    lay.pageMar = 10;
//
//    lay.pageWidth = TKScreenWidth;
//
//    lay.scrollBlock = ^(NSInteger pageNum) {
//
//        self.currentPage = pageNum;
//
//        [self.bar clickButtonWithTag:pageNum];
//
//    };
//
//    UICollectionView *collectV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.bar.frame.size.height+self.bar.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height - (self.bar.frame.size.height+self.bar.frame.origin.y)) collectionViewLayout:lay];
//
//    collectV.delegate = self;
//
//    collectV.dataSource = self;
//
//    collectV.backgroundColor = [UIColor whiteColor];
//
////    collectV.pagingEnabled = YES;
//
//    collectV.showsVerticalScrollIndicator = NO;
//
//    collectV.showsHorizontalScrollIndicator = NO;
//
//    [self.view addSubview:collectV];
//
//    self.coll = collectV;
//
//    collectV.decelerationRate = 0.1;
//
//    [self.view addSubview:collectV];
//
//    [self.coll registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
//
//}
//
//#pragma mark <UICollectionViewDataSource>
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
//    return 1;
//}
//
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
//    return self.self.childViewControllers.count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//
//
//
//
//
//
//
//
//
//
//    return cell;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    UIView *view;
//    UIViewController *vc = (UIViewController *)self.childViewControllers[indexPath.row];
////    NSLog(@"%@-%@",vc,indexPath);
//    view = vc.view;
//    view.frame = cell.contentView.bounds;
//    [cell.contentView addSubview:view];
//
//    NSLog(@"%@",collectionView.visibleCells);
////    NSLog(@"willdisplay:%@",indexPath);
//
//}
//-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    for (UIView *view in cell.contentView.subviews) {
//        if (view) {
//            [view removeFromSuperview];
//        }
//    }
//}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [self.view endEditing:YES];
////    NSInteger a = scrollView.contentOffset.x/scrollView.frame.size.width;
//    NSInteger page = scrollView.contentOffset.x/scrollView.frame.size.width +0.5;
//    //    ZKRLog(@"%f",scrollView.contentOffset.x);
//    //__weak typeof (self) weekSelf = self;
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.2];
//    [self.bar clickButtonWithTag:page];
//    [UIView commitAnimations];
//
//}

@end
