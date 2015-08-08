//
//  DrawAreaView.m
//  画板-beta
//
//  Created by Lucky on 15/8/7.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import "DrawAreaView.h"

@implementation DrawAreaView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.lineWidth = 4;
        self.drawColor = [UIColor blackColor];
        pathModalArray = [[NSMutableArray alloc] init];

    }
    return self;
}

//触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    //当begin的时候创建path
    
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, point.x, point.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    //把点添加到路径上面
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    
    //每次移动，重新绘图
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //modal中存储了每条线的属性数据 （yanse、线宽、路径）
    LineModal *modal = [[LineModal alloc] init];
    modal.color = self.drawColor;
    modal.width = self.lineWidth;
    modal.path = path;
    
    [pathModalArray addObject:modal];
    
    CGPathRelease(path);
    
    path = nil;
    
    
}

- (void)drawRect:(CGRect)rect
{
    
    //1 遍历 路径数组 把所有以前的path都绘制出来
    for (LineModal *modal in pathModalArray) {
        //每个modal 描述一条线
        //1 得到上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        //2 设置属性
        
        [modal.color setStroke];
        CGContextSetLineWidth(context, modal.width);
        
        //3 把path添加到context中
        CGContextAddPath(context, modal.path);
        
        //4 绘制
        CGContextDrawPath(context, kCGPathStroke);
    }
    
    //2 画当前的线
    if (path != nil) {
        //01 得到上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //02 把path添加到context中
        CGContextAddPath(context, path);
        
        //03 设置属性
        [self.drawColor setStroke];
        CGContextSetLineWidth(context, self.lineWidth);
        
        //绘制
        CGContextDrawPath(context, kCGPathStroke);
    }
    
    
}

- (void)backAction
{
    [pathModalArray removeLastObject];
    [self setNeedsDisplay];
}
- (void)clearAction
{
    [pathModalArray removeAllObjects];
    [self setNeedsDisplay];
}
@end
