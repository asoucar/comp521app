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
//        self.wordImage = [UIImage imageNamed: [NSString stringWithFormat:@"%@.png", aWord]];
//        NSString *happysoundPath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%@_happy", aWord] ofType:@"aif"];
//        NSURL *happysoundURL =[NSURL fileURLWithPath:happysoundPath];
//        SystemSoundID happysoundFileID;
//        AudioServicesCreateSystemSoundID ((__bridge CFURLRef)happysoundURL, &happysoundFileID);
//        [self.sounds setObject:[NSNumber numberWithUnsignedLong:happysoundFileID] forKey:@"happy"];
//        
//        NSString *sadsoundPath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%@_sad", aWord] ofType:@"aif"];
//        NSURL *sadsoundURL =[NSURL fileURLWithPath:sadsoundPath];
//        SystemSoundID sadsoundFileID;
//        AudioServicesCreateSystemSoundID ((__bridge CFURLRef)sadsoundURL, &sadsoundFileID);
//        [self.sounds setObject:[NSNumber numberWithUnsignedLong:sadsoundFileID] forKey:@"sad"];

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

