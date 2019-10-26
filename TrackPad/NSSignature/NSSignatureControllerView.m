//
//  NSSignatureControllerView.m
//  TrackPad
//
//  Created by Han Mingjie on 2019/10/26.
//  Copyright © 2019 Han Mingjie. All rights reserved.
//

#import "NSSignatureControllerView.h"
#import "NSSignatureView.h"
#import <OpenMultitouchSupport/OpenMultitouchSupport.h>

@interface NSSignatureControllerView(){
    OpenMTManager *manager;
    OpenMTListener *listener;
}
@property (nonatomic,strong) IBOutlet NSButton *begin_button;
@property (nonatomic,strong) IBOutlet NSButton *cancel_button;
@property (nonatomic,strong) IBOutlet NSButton *done_button;
@property (nonatomic,strong) IBOutlet NSButton *clear_button;
@property (nonatomic,strong) IBOutlet NSSignatureView *sign_view;
@property (nonatomic,strong) IBOutlet NSTextField *tip_label;

@end


@implementation NSSignatureControllerView
@synthesize begin_button;
@synthesize cancel_button;
@synthesize done_button;
@synthesize clear_button;
@synthesize sign_view;
@synthesize tip_label;
@synthesize png_image_data;


-(IBAction)begin_button_action:(id)sender{
    if (nil == manager){
        manager = [OpenMTManager sharedManager];
    }
    if (nil == listener){
        listener = [manager addListenerWithTarget:self selector:@selector(touch_received:)];
    }
    begin_button.alphaValue = 0.f;
    cancel_button.enabled = NO;
    done_button.enabled = YES;  //TODO
    clear_button.enabled = NO;
    tip_label.stringValue = @"Press any key to finished.";
}

-(IBAction)cancel_button_action:(id)sender{
    [manager removeListener:listener];
    [self.window.sheetParent endSheet:self.window returnCode:NSModalResponseCancel];
}

-(IBAction)done_button_action:(id)sender{
    [manager removeListener:listener];
    png_image_data = [sign_view get_data];
    [self.window.sheetParent endSheet:self.window returnCode:NSModalResponseOK];
}

-(IBAction)clear_button_action:(id)sender{
    [sign_view clear];
}

-(void)touch_received:(OpenMTEvent *)event{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (OpenMTTouch *touch in event.touches){
            if (OpenMTStateLeaving == touch.state
                || OpenMTStateNotTouching == touch.state){
                [self->sign_view addStop];
            }else{
                [self->sign_view addPointWithX:touch.posX y:touch.posY];
            }
        }
        [self->sign_view setNeedsDisplay:YES];
    });
    return;
}

@end
