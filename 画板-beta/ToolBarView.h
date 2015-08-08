//
//  ToolBarView.h
//  画板-beta
//
//  Created by Lucky on 15/8/7.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "common.h"

//类型
typedef void(^ColorSelBlockType)(UIColor *color);
typedef void(^WidthSelBlockType)(CGFloat width);
typedef void(^FuncSelBlockType)(void);

@interface ToolBarView : UIView
{
    UIView *topBarView;
    
    UIView *selectColorView;
    UIView *selectWidthView;
    
    NSArray *selectColorArray;
    NSArray *selectWidthArray;
}




@property (nonatomic,copy) ColorSelBlockType colorSelBlock;
@property (nonatomic,copy) WidthSelBlockType widthSelBlock;
@property (nonatomic,copy) FuncSelBlockType eraseSelBlock;
@property (nonatomic,copy) FuncSelBlockType backSelBlock;
@property (nonatomic,copy) FuncSelBlockType clearSelBlock;

@end
