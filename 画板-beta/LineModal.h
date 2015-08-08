//
//  LineModal.h
//  画板-beta
//
//  Created by Lucky on 15/8/7.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface LineModal : NSObject

//modal中存储了每条线的属性数据 （颜色、线宽、路径）
@property (nonatomic,strong) UIColor *color;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGMutablePathRef path;

@end
