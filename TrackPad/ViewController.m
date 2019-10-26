//
//  ViewController.m
//  TTT
//
//  Created by Han Mingjie on 2019/10/26.
//  Copyright © 2019 Han Mingjie. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


-(IBAction)action:(id)sender{
    NSWindowController *w = [[NSWindowController alloc] initWithWindowNibName:@"NSSignatureWindow"];
    [self.view.window beginSheet:w.window completionHandler:^(NSModalResponse returnCode) {
        
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
