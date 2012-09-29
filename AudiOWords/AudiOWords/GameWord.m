//
//  gameWord.m
//  AudiOWords
//
//  Created by Ashley Soucar on 9/26/12.
//  Copyright (c) 2012 Spellers. All rights reserved.
//

#import "GameWord.h"

@implementation GameWord

@synthesize letters, theWord, wordImage, sounds;

#pragma mark - initialization methods

+(id)gameWordWithWord:(NSString *)aWord
{
    return [[self alloc] initWithWord:aWord];
}


-(id)initWithWord:(NSString *)aWord
{
    self = [super init];
    if (self){
        self.sounds = [NSMutableDictionary dictionary];
        
        self.theWord = aWord;
        
        self.letters = [[NSMutableArray alloc] initWithCapacity:[aWord length]];
        
        for (int i=0; i < [aWord length]; i++) {
            NSString *iletter  = [NSString stringWithFormat:@"%c", [aWord characterAtIndex:i]];
            [letters addObject:iletter];
        }
        
        self.wordImage = [UIImage imageNamed: [NSString stringWithFormat:@"%@.PNG", aWord]];
        //NSString *happysoundPath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%@_happy", aWord] ofType:@"aif"];
        NSString *happysoundPath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"happysound"] ofType:@"aiff"];
        NSURL *happysoundURL =[NSURL fileURLWithPath:happysoundPath];
        SystemSoundID happysoundFileID;
        AudioServicesCreateSystemSoundID ((__bridge CFURLRef)happysoundURL, &happysoundFileID);
        [self.sounds setObject:[NSNumber numberWithUnsignedLong:happysoundFileID] forKey:@"happy"];
        
        //NSString *sadsoundPath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%@_sad", aWord] ofType:@"aif"];
        NSString *sadsoundPath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"sadsound"] ofType:@"aiff"];
        NSURL *sadsoundURL =[NSURL fileURLWithPath:sadsoundPath];
        SystemSoundID sadsoundFileID;
        AudioServicesCreateSystemSoundID ((__bridge CFURLRef)sadsoundURL, &sadsoundFileID);
        [self.sounds setObject:[NSNumber numberWithUnsignedLong:sadsoundFileID] forKey:@"sad"];

    }
    return self;
}




#pragma mark - sounds

-(void)playHappySound
{
    AudioServicesPlaySystemSound ([[self.sounds objectForKey:@"happy"] unsignedLongValue]);
}

-(void)playSadSound
{
    AudioServicesPlaySystemSound ([[self.sounds objectForKey:@"sad"] unsignedLongValue]);
}

@end

