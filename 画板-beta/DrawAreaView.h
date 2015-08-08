//
//  DrawAreaView.h
//  画板-beta
//
//  Created by Lucky on 15/8/7.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineModal.h"

@interface DrawAreaView : UIView
{
    CGMutablePathRef path;
    //存储 每一条路径的modal (path,颜色 线宽),数组存储了N条线的信息
    NSMutableArray *pathModalArray;
}
//当前线
@property (nonatomic,strong) UIColor *drawColor;
@property (nonatomic,assign) CGFloat lineWidth;

- (void)backAction;
- (void)clearAction;

@end
