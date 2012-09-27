//
//  MainGameVC.m
//  AudiOWords
//
//  Created by Ashley Soucar on 9/21/12.
//  Copyright (c) 2012 Spellers. All rights reserved.
//

#import "MainGameVC.h"
#import "MainMenuVC.h"
#import "GameWord.h"

@interface MainGameVC ()

@property (nonatomic, retain) NSMutableArray *levelWords;

@end

@implementation MainGameVC

@synthesize levelWords;

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
    
    self.levelWords = [NSMutableArray array];
    
    //eventually to be replaced by call to 'database'
    GameWord *firstWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Cat"]];
    GameWord *secondWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Dog"]];
    GameWord *thirdWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Cow"]];
    GameWord *fourthWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Pig"]];
    
    [self.levelWords addObject:firstWord];
    [self.levelWords addObject:secondWord];
    [self.levelWords addObject:thirdWord];
    [self.levelWords addObject:fourthWord];
    
    
    [self setupLevelWithWord:[levelWords objectAtIndex:0]];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.levelWords removeAllObjects];
    self.levelWords = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - game setup

-(void)setupLevelWithWord:(GameWord *)word
{
    //pull letters from gameword
    
    //create draggable buttons
    //use for loop through letters
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:word.theWord forState:UIControlStateNormal];
    
	// add drag listener
	[button addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    
	// center and size
	button.frame = CGRectMake((self.view.bounds.size.width - 100)/2.0,
                              (self.view.bounds.size.height - 50)/4*3,
                              100, 50);
    
	// add it
	[self.view addSubview:button];
}

#pragma mark - game function

- (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event
{
	// get the touch
	UITouch *touch = [[event touchesForView:button] anyObject];
    
	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    
	// move button
	button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y + delta_y);
}

#pragma mark - navigation button(s)

- (IBAction)backButton
{
    MainMenuVC *menuVC = [[MainMenuVC alloc] init];
    [self.view.window setRootViewController:menuVC];
}


@end
