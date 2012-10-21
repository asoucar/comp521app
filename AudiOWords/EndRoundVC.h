//
//  EndRoundVC.h
//  AudiOWords
//
//  Created by Ashley Soucar on 10/21/12.
//  Copyright (c) 2012 Spellers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndRoundVC : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *nextLevel;
@property (strong, nonatomic) IBOutlet UIButton *redoLevel;

- (IBAction)goToRedoLevel;
- (IBAction)goToNextLevel;




@end
