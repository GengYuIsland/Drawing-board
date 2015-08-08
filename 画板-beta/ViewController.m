//
//  ViewController.m
//  画板-beta
//
//  Created by Lucky on 15/8/7.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ToolBarView *toolBarView = [[ToolBarView alloc] initWithFrame:CGRectMake(0, 44, kWidth, 88)];
    [self.view addSubview:toolBarView];
    DrawAreaView *drawAreaView = [[DrawAreaView alloc] initWithFrame:CGRectMake(0, 132, kWidth, kHeight-132)];
    [self.view addSubview:drawAreaView];
    
    
    toolBarView.colorSelBlock = ^(UIColor *color)
    {
        drawAreaView.drawColor = color;
    };
    
    toolBarView.widthSelBlock = ^(CGFloat width)
    {
        drawAreaView.lineWidth = width;
    };
    
    toolBarView.eraseSelBlock = ^{
        drawAreaView.lineWidth = 50;
        drawAreaView.drawColor = [UIColor whiteColor];
    };
    
    toolBarView.backSelBlock = ^{
        [drawAreaView backAction];
    };
    
    toolBarView.clearSelBlock = ^{
        [drawAreaView clearAction];
    };


    
}


@end
