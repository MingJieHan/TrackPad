//
//  NSSignatureView.h
//  TrackPad
//
//  Created by Han Mingjie on 2019/10/26.
//  Copyright © 2019 Han Mingjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSSignatureView : NSView{
    NSColor *lineColor;
    float lineWidth;
}
@property (nonatomic) NSColor *lineColor;
@property (nonatomic) float lineWidth;

-(void)clear;
-(void)addPointWithX:(float)x y:(float)y;
-(void)addStop;
-(NSData *)get_data;
@end

NS_ASSUME_NONNULL_END
