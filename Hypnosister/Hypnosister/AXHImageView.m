//
//  AXHImageView.m
//  Hypnosister
//
//  Created by Axel Han on 16/1/5.
//  Copyright © 2016年 Axel Han. All rights reserved.
//

#import "AXHImageView.h"

@implementation AXHImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    //Exercise: Draw an Image
    UIImage *loadImage = [UIImage imageNamed:@"logo.png"];
    float x0 = bounds.origin.x;
    float y0 = bounds.origin.y;
    float width = bounds.size.width;
    float height = bounds.size.height;
    
    CGRect imageRect = CGRectMake(x0 + 10, y0 + 10, width - 20, height - 40);
    
    // Shadows
    CGContextRef currentContex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContex);
    CGContextSetShadow(currentContex, CGSizeMake(6, 10), 3);
    //CGContextRestoreGState(currentContex);
    
    
    // Gradients
    CGContextSaveGState(currentContex);
    
    UIBezierPath *myPath = [[UIBezierPath alloc] init];
    CGPoint p1 = CGPointMake(x0 + width / 2.0, y0);
    CGPoint p2 = CGPointMake(x0, y0 + height);
    CGPoint p3 = CGPointMake(x0 + width, y0 + height);
    
    [myPath moveToPoint:p1];
    [myPath addLineToPoint:p2];
    [myPath addLineToPoint:p3];
    [myPath addLineToPoint:p1];
    [myPath addClip];
    
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 0.0, 1.0,
        0.0, 1.0, 0.0, 1.0 };
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    CGPoint startPoint = CGPointMake(x0, y0+height);
    CGPoint endPoint = CGPointMake(x0, y0);
    CGContextDrawLinearGradient(currentContex, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(currentContex);
    
    [loadImage drawInRect:imageRect];
}




@end
