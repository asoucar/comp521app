//
//  MainMenuVC.m
//  AudiOWords
//
//  Created by Ashley Soucar on 9/21/12.
//  Copyright (c) 2012 Spellers. All rights reserved.
//

#import "MainMenuVC.h"
#import "MainGameVC.h"
#import "AboutVC.h"
#import "LevelsVC.h"
#import "SettingsVC.h"
#import "TutorialVC.h"


@interface MainMenuVC ()

@end

@implementation MainMenuVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)startGameButton
{
    MainGameVC *gameVC = [[MainGameVC alloc] init];
    [self.view.window setRootViewController:gameVC];
}

- (IBAction)aboutButton
{
    AboutVC *aboutVC = [[AboutVC alloc] init];
    [self.view.window setRootViewController:aboutVC];
}

- (IBAction)levelsButton
{
    LevelsVC *levelVC = [[LevelsVC alloc] init];
    [self.view.window setRootViewController:levelVC];
}

- (IBAction)settingsButton
{
    SettingsVC *settingVC = [[SettingsVC alloc] init];
    [self.view.window setRootViewController:settingVC];
}

- (IBAction)tutorialButtons
{
    TutorialVC *tutorialVC = [[TutorialVC alloc] init];
    [self.view.window setRootViewController:tutorialVC];
}
@end
