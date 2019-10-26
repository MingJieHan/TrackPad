//
//  NSSignatureView.m
//  TrackPad
//
//  Created by Han Mingjie on 2019/10/26.
//  Copyright © 2019 Han Mingjie. All rights reserved.
//

#import "NSSignatureView.h"


@interface NSSignatureView(){
    NSMutableArray <NSValue *>*points_array;
}
@end


@implementation NSSignatureView
@synthesize lineWidth;
@synthesize lineColor;

-(id)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self){
        points_array = [[NSMutableArray alloc] init];
        lineColor = [NSColor blackColor];
        lineWidth = 1.6;
        self.wantsLayer = YES;
        self.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    }
    return self;
}

-(void)clear{
    [points_array removeAllObjects];
    [self setNeedsDisplay:YES];
}

-(void)addPointWithX:(float)x y:(float)y{
    NSPoint point = NSPointFromCGPoint(CGPointMake(x * self.frame.size.width, y * self.frame.size.height));
    [points_array addObject:[NSValue valueWithPoint:point]];
}

-(void)addStop{
    NSPoint point = NSPointFromCGPoint(CGPointZero);
    [points_array addObject:[NSValue valueWithPoint:point]];
    [self setNeedsDisplay:YES];
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    CGContextRef context = [NSGraphicsContext currentContext].CGContext;
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextSetLineWidth(context, lineWidth);
    BOOL isPenDown = NO;
    for (NSValue *value in points_array){
        NSPoint point = [value pointValue];
        if (0 == point.x && 0 == point.y){
            isPenDown = NO;
            continue;
        }
        if (isPenDown){
            CGContextAddLineToPoint(context, point.x, point.y);
        }else{
            isPenDown = YES;
            CGContextMoveToPoint(context, point.x, point.y);
        }
    }
    CGContextStrokePath(context);
}


-(NSData *)get_data{
    self.layer.backgroundColor = [NSColor clearColor].CGColor;
    NSBitmapImageRep *rep = [self bitmapImageRepForCachingDisplayInRect:NSRectFromCGRect(CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height))];
    [self cacheDisplayInRect:NSRectFromCGRect(CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height)) toBitmapImageRep:rep];
    NSDictionary *dict = [NSDictionary dictionary];
    NSData *data = [rep representationUsingType:NSBitmapImageFileTypePNG properties:dict];
    return data;
}
@end
