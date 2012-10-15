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
    NSMutableArray *word_levels = [[NSMutableArray alloc] init];
    //creates a temp variable 'level' that in the actual program will be replaced
    int level = 1;
    //creation of the filePath to the word_level list: word_level_list.txt
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"word_level_list"
                                                        ofType:@"txt"];
    //opens the file word_level_list.txt into a string called fileContents
    NSString *fileContents = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    //splits fileContents into an array with each entry looking like 'word #'
    NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
    
    //create an array of words from the file that occur at the appropriate level
    for (int i=0; i<([lines count]-1); i++){
        NSString *word_line = [lines objectAtIndex:i];
       
        NSArray *word = [word_line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        word = [word filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF !=''"]];
        //This should put the word at index[0] and level at index[1]
               
        //Checks if the word belongs in the level, i.e. it must have a level value equal to the current level, eventually we will place additional logic here
        if ([[word objectAtIndex:1] intValue] == level) {
            

           [word_levels addObject:[word objectAtIndex:0]];
            //this should add the word to the array if the level is less than or equal
            NSLog(@"%@",[word_levels objectAtIndex:([word_levels count]-1)]);
        }
    }
    // this is where we will put the random number generator to select 4 words from word_levels by selecting random indexes between 0 and ([word_level count] -1)
    
    
    //int size = [word_levels count];
    //NSLog(@"there are %d objects in the array", size);
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
