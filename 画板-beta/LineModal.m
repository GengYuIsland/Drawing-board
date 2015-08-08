//
//  LineModal.m
//  画板-beta
//
//  Created by Lucky on 15/8/7.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import "LineModal.h"

@implementation LineModal

- (void)setPath:(CGMutablePathRef)path
{
    if (_path != path) {
        _path = (CGMutablePathRef)CGPathRetain(path);
    }
}

- (void)dealloc
{
    CGPathRelease(_path);
}
@end
