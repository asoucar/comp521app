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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *words_appro_for_level = [[NSMutableArray alloc] init];
    NSMutableArray *rounds_words = [[NSMutableArray alloc] init]; //the end destination for the 4 round words
    
    //creates a temp variable 'level' that in the actual program will be replaced
    int level = 2;
    //creation of the filePath to the word_level list: word_level_list.txt
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"word_level_list"
                                                        ofType:@"txt"];
    //opens the file word_level_list.txt into a string called fileContents
    NSString *fileContents = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    //splits fileContents into an array with each entry looking like 'word #'
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    
    //create an array of words from the file that occur at the appropriate level
    for (int i=0; i<([lines count]-1); i++){
        //word line contains the word # pair at each index
        NSString *word_line = [lines objectAtIndex:i];
       
        //word is an array for each line with word at index[0] and level at index[1]
        NSArray *word = [word_line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        word = [word filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF !=''"]];
        
        //Checks if the word belongs in the level, i.e. it must have a level value equal to the current level, eventually we will place additional logic here
        if (level != 0 && [[word objectAtIndex:1] intValue] <= level) {
            
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
    // this is where we will put the random number generator to select 4 words from word_levels by selecting random indexes between 0 and ([word_level count] -1)

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
