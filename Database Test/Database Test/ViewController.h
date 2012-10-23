//
//  ViewController.h
//  Database Test
//
//  Created by ResNET on 10/10/12.
//  Copyright (c) 2012 ResNET. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <Slt/Slt.h>
#import <OpenEars/FliteController.h>

@interface ViewController : UIViewController{
    FliteController *fliteController;
    Slt *slt;
}
@property (strong, nonatomic) FliteController *fliteController;
@property (strong, nonatomic) Slt *slt;

@end
