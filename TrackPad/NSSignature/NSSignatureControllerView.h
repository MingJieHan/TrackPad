//
//  NSSignatureControllerView.h
//  TrackPad
//
//  Created by Han Mingjie on 2019/10/26.
//  Copyright © 2019 Han Mingjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSSignatureControllerView : NSView{
    NSData *png_image_data;
}
@property (nonatomic,readonly) NSData *png_image_data;
@end
NS_ASSUME_NONNULL_END
