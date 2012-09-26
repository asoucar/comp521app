//
//  ViewController.m
//  Soundtest
//
//  Created by Mandy Melton on 9/24/12.
//  Copyright (c) 2012 Mandy Melton. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)play:(id)sender {
    SystemSoundID soundID;
    NSString *buttonName=[sender currentTitle];
    NSString *soundFile=[[NSBundle mainBundle] pathForResource:buttonName ofType:@"aif"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    AudioServicesPlaySystemSound(soundID);
    
}


@end
