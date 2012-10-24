//
//  ViewController.m
//  Database Test
//
//  Created by ResNET on 10/10/12.
//  Copyright (c) 2012 ResNET. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize fliteController;
@synthesize slt;

- (FliteController *)fliteController {
    if (fliteController == nil){
        fliteController = [[FliteController alloc] init];
    }
    return fliteController;
}

- (Slt *)slt {
    if (slt == nil){
        slt = [[Slt alloc] init];
    }
    return slt;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *words_appro_for_level = [[NSMutableArray alloc] init];
    NSMutableArray *rounds_words = [[NSMutableArray alloc] init]; //the end destination for the 4 round words
    NSArray *alphabet = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i", @"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    NSMutableArray *round =[[NSMutableArray alloc] init]; //the final words with all modifications
    
    //creates a temp variable 'level' that in the actual program will be replaced
    int level = 13;
    int level_ceilling;
    //creation of the filePath to the word_level list: word_level_list.txt
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"word_level_list"
                                                        ofType:@"txt"];
    //opens the file word_level_list.txt into a string called fileContents
    NSString *fileContents = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    //splits fileContents into an array with each entry looking like 'word #'
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    //starts the level logic
    if(level == 1 || level == 3 || level == 5){
        level_ceilling = level;
    }
    else if(level == 2 || level == 7 || level == 10 || level == 13){
        level_ceilling = 2;
    }
    else if(level == 4 || level == 8 || level == 11 || level == 14){
        level_ceilling = 3;
    }
    else if(level == 6 || level == 9 || level == 12 || level == 15){
        level_ceilling = 6;
    }
    else level_ceilling = 6;
    
    //create an array of words from the file that occur at the appropriate level
    for (int i=0; i<([lines count]-1); i++){
        //word line contains the word # pair at each index
        NSString *word_line = [lines objectAtIndex:i];
       
        //word is an array for each line with word at index[0] and level at index[1]
        NSArray *word = [word_line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        word = [word filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF !=''"]];
        
        //Checks if the word belongs in the level, i.e. it must have a level value equal to the current level, eventually we will place additional logic here
        if (level != 0 && [[word objectAtIndex:1] intValue] <= level_ceilling) {
           [words_appro_for_level addObject:[word objectAtIndex:0]];
            //this should add the word to the array if the level is less than or equal
            //NSLog(@"%@",[words_appro_for_level objectAtIndex:([words_appro_for_level count]-1)]);
        }
    }
    //shuffles the array of words_appro_for_level
    for (int i =0; i < ([words_appro_for_level count]-1); i++){
        int nElements = ([words_appro_for_level count]-i);
        int n =arc4random_uniform(nElements)+i;
        [words_appro_for_level exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    //places the first 4 objects in the words_appro_for_level which are randomized due to the shuffle
    for (int i =0; i<4; i++){
    [rounds_words addObject:[words_appro_for_level objectAtIndex:i]];
    }
    
    //test print
    for (int i =0; i<4; i++){
        NSLog(@"%@",[rounds_words objectAtIndex:(i)]);
    }
    //test voice
    for (int i =0; i< ([rounds_words count]-1); i++){
    [self.fliteController say:[rounds_words objectAtIndex:(i)] withVoice:self.slt];
        
    }

    //modifies the words based on round
        if(level >= 7 && level <= 9){
                for (int i=0; i<([rounds_words count]); i++){
                int position = (arc4random() %25);
            
                NSString *string = [[NSString alloc] initWithString:[rounds_words objectAtIndex:i]];
                string = [string stringByAppendingString:[alphabet objectAtIndex:position]];
                [round addObject:string];
            }
        }
        else if(level >= 10 && level <= 12){
            for (int i=0; i<([rounds_words count]); i++){
                int position = (arc4random() %25);
                int position2 = (arc4random() %25);
            
                NSString *string = [[NSString alloc] initWithString:[rounds_words objectAtIndex:i]];
                string = [string stringByAppendingString:[alphabet objectAtIndex:position]];
                NSString *string2 = [[NSString alloc] initWithString:string];
                string2 = [string2 stringByAppendingString:[alphabet objectAtIndex:position2]];
                [round addObject:string2];
            }
        }
       else if(level >= 13 && level <= 15){
            for (int i=0; i<([rounds_words count]); i++){
                int position = (arc4random() %25);
                int position2 = (arc4random() %25);
                int position3 = (arc4random() %25);
            
                NSString *string = [[NSString alloc] initWithString:[rounds_words objectAtIndex:i]];
                string = [string stringByAppendingString:[alphabet objectAtIndex:position]];
                NSString *string2 = [[NSString alloc] initWithString:string];
                string2 = [string2 stringByAppendingString:[alphabet objectAtIndex:position2]];
                NSString *string3 = [[NSString alloc] initWithString:string2];
                string3 = [string3 stringByAppendingString:[alphabet objectAtIndex:position3]];
                [round addObject:string3];
            }
        }
       else if(level < 7){
            for (int i=0; i<([rounds_words count]); i++){
                [round addObject:[rounds_words objectAtIndex:i]];
                }
        }
    
    //test the contents of round print
    for (int i =0; i<4; i++){
        NSLog(@"%@",[round objectAtIndex:(i)]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
