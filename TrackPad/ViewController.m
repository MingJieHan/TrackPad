//
//  ViewController.m
//  TTT
//
//  Created by Han Mingjie on 2019/10/26.
//  Copyright © 2019 Han Mingjie. All rights reserved.
//

#import "ViewController.h"
#import "NSSignatureControllerView.h"
@implementation ViewController


-(IBAction)action:(id)sender{
    NSWindowController *w = [[NSWindowController alloc] initWithWindowNibName:@"NSSignatureWindow"];
    [self.view.window beginSheet:w.window completionHandler:^(NSModalResponse returnCode) {
        if (NSModalResponseOK == returnCode){
            NSSignatureControllerView *vv = (NSSignatureControllerView *)w.window.contentView;
            [vv.png_image_data writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"aaa.png"] atomically:YES];
            return;
        }
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
