//
//  ToolBarView.m
//  画板-beta
//
//  Created by Lucky on 15/8/7.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import "ToolBarView.h"

@implementation ToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _createTopBarView];
        [self _createSelectColorView];
        [self _createSelectWidthView];
    }
    
    return self;
}

- (void)_createTopBarView
{
    topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44)];
    topBarView.backgroundColor = [UIColor grayColor];
    
    
    NSArray *titleArray = @[@"颜色",@"线宽",@"橡皮",@"撤销",@"清屏"];
    
    CGFloat width = kWidth / 5;
    for (int i = 0; i < 5; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, 44)];
        
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        
        button.tag = 100+i;
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [topBarView addSubview:button];
        
    }
    [self addSubview:topBarView];
    NSLog(@"top bar view");
    
}

- (void)btnAction:(UIButton *)button
{

    switch (button.tag - 100) {
        case 0:
            selectColorView.hidden = NO;
            selectWidthView.hidden = YES;
            break;
        
        case 1:
            selectWidthView.hidden = NO;
            selectColorView.hidden = YES;
            break;
            
        case 2:
            if (self.eraseSelBlock) {
                self.eraseSelBlock();
            }
            break;
            
        case 3:
            if (self.backSelBlock) {
                self.backSelBlock();
            }
            break;
            
        case 4:
            if (self.clearSelBlock) {
                self.clearSelBlock();
            }
            break;
            
        default:
            break;
    }
}

- (void)_createSelectColorView
{
    selectColorView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, kWidth, 44)];
    [self addSubview:selectColorView];
    selectColorView.backgroundColor = [UIColor grayColor];
    
    selectColorArray = @[ [UIColor redColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],[UIColor purpleColor],[UIColor blackColor],[UIColor brownColor] ];
    
    CGFloat width = kWidth / 7;
    for (int i = 0; i < 7; i ++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, 44)];
        button.tag = 100 + i;
        button.backgroundColor = selectColorArray[i];
        
        [button addTarget:self action:@selector(colorSelAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [selectColorView addSubview:button];
        
    }
    
    
}

- (void)_createSelectWidthView
{
    selectWidthView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, kWidth, 44)];
    [self addSubview:selectWidthView];
    selectWidthView.backgroundColor = [UIColor grayColor];
    selectWidthView.hidden = YES;
    
    selectWidthArray = @[ @2, @4, @6, @8, @10, @12, @14 ];
    
    CGFloat width = kWidth / 7;
    for (int i = 0; i < 7; i ++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, 44)];
        button.tag = 100 + i;

        [button setTitle:[NSString stringWithFormat:@"%@",selectWidthArray[i]] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(widthSelAction:) forControlEvents:UIControlEventTouchUpInside];

        button.backgroundColor = [UIColor grayColor];
        [selectWidthView addSubview:button];
    }
}

- (void)colorSelAction:(UIButton *)button
{
    UIColor *color = selectColorArray[button.tag - 100];
    
    if (_colorSelBlock) {
        _colorSelBlock(color);
    }
}

- (void)widthSelAction:(UIButton *)button
{
    NSNumber *number = selectWidthArray[button.tag - 100];
    if (_widthSelBlock) {
        _widthSelBlock(number.floatValue);
    }
}
@end
