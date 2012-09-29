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
@property (nonatomic, retain) UIImageView *target;
@property (nonatomic, retain) NSString *nextLetter;
@property (nonatomic) BOOL isWordSpelled;
@property (nonatomic, retain) NSMutableArray *thisWordsSpelling;
@property (nonatomic, retain) GameWord *currentWord;
@property (nonatomic) int currentIndex;
@property (nonatomic, retain) NSMutableArray *letterButtons;
@property (nonatomic) int letterIndex;
@property (nonatomic) BOOL wrongLetterBool;

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
    self.currentIndex = 0;
    self.letterIndex = 0;
    self.letterButtons = [NSMutableArray array];
    self.thisWordsSpelling = [NSMutableArray array];
    
    
    //eventually to be replaced by call to 'database'
    GameWord *firstWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Cat"]];
    GameWord *secondWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Dog"]];
    GameWord *thirdWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Cow"]];
    GameWord *fourthWord = [GameWord gameWordWithWord:[NSString stringWithFormat:@"Duck"]];
    
    [self.levelWords addObject:firstWord];
    [self.levelWords addObject:secondWord];
    [self.levelWords addObject:thirdWord];
    [self.levelWords addObject:fourthWord];
    
    self.currentWord = [levelWords objectAtIndex:self.currentIndex];
    
    [self setupLevelWithWord:self.currentWord];
    
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
    self.isWordSpelled = NO;
    self.wrongLetterBool = NO;
    
    //add pic
    self.target = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width)/2.6,
                                                                (self.view.bounds.size.height)/4,
                                                                250, 250)];
    //self.target.image = word.wordImage;
    //for test
    UIImage *testImage = [UIImage imageNamed:@"box_blue.png"];
    self.target.image = testImage;
    [self.view addSubview:self.target];
    
    //pull letters from gameword
    //create draggable buttons
    //use for loop through letters
    int tempCount = 1;
    for (NSString *lett in self.currentWord.letters) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:lett forState:UIControlStateNormal];
        
        // add drag listener
        [button addTarget:self action:@selector(wasDragged:withEvent:)
         forControlEvents:UIControlEventTouchDragInside];
        
        [button addTarget:self action:@selector(touchesEnded:withEvent:)
         forControlEvents:UIControlEventTouchUpInside];

        
        // center and size
        button.frame = CGRectMake((self.view.bounds.size.width - 100)/(self.currentWord.letters.count+1)*tempCount,
                                  (self.view.bounds.size.height - 50)/5*4,
                                  100, 50);
        
        // add it
        [self.view addSubview:button];
        
        [self.letterButtons addObject:button];
        tempCount++;
        
    }
    
    self.nextLetter = [self.currentWord.letters objectAtIndex:self.letterIndex];
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

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIButton *button in self.letterButtons) {
        if (button.center.x > 350 &&
            button.center.x < 650 &&
            button.center.y > 250 &&
            button.center.y < 500) {
            [button removeFromSuperview];
            button.center = CGPointMake(0, 0);
            [self isCorrectLetter:button.titleLabel.text];
        }
    }

    if (self.wrongLetterBool) {
        [self wrongLetter];
    }
    
    if (self.isWordSpelled) {
        //play win sound
        [self resetScreen];
        if (self.levelWords.count == self.currentIndex+1) {
            UILabel *winLabel = [[UILabel alloc] initWithFrame:CGRectMake(475, 200, 300, 300)];
            winLabel.text = @"You Win!";
            [self.view addSubview:winLabel];
        }
        else{
            self.currentIndex++;
            self.currentWord = [self.levelWords objectAtIndex:self.currentIndex];
            [self setupLevelWithWord:self.currentWord];
        }
    }
}

-(void)isCorrectLetter:(NSString *)letter
{
    if ([letter isEqualToString:self.nextLetter]) {
        [self.thisWordsSpelling addObject:letter];
        [self.currentWord playHappySound];
       
        if (self.thisWordsSpelling.count == self.currentWord.letters.count) {
            self.isWordSpelled = YES;
        }
        else{
            self.letterIndex++;
            self.nextLetter = [self.currentWord.letters objectAtIndex:self.letterIndex];
        }
    }
    else{
        [self.currentWord playSadSound];
        self.wrongLetterBool = YES;
    }
        
}

-(void)wrongLetter
{
    self.isWordSpelled = NO;
    [self resetScreen];
    [self setupLevelWithWord:self.currentWord];
}

-(void)resetScreen{
    [self.target removeFromSuperview];
    for (UIButton *button in self.letterButtons) {
        [button removeFromSuperview];
    }
    [self.letterButtons removeAllObjects];
    [self.thisWordsSpelling removeAllObjects];
    self.letterIndex = 0;

}

#pragma mark - navigation button(s)

- (IBAction)backButton
{
    MainMenuVC *menuVC = [[MainMenuVC alloc] init];
    [self.view.window setRootViewController:menuVC];
}


@end
