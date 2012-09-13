//
//  ViewController.m
//  gitTest
//
//  Created by Ashley Soucar on 9/13/12.
//  Copyright (c) 2012 Ashley Soucar. All rights reserved.
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)colorChange {
    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)otherColor {
    self.view.backgroundColor = [UIColor greenColor];
}
@end
