//
//  gameWord.m
//  AudiOWords
//
//  Created by Ashley Soucar on 9/26/12.
//  Copyright (c) 2012 Spellers. All rights reserved.
//

#import "GameWord.h"

@implementation GameWord

@synthesize letters, theWord, pic;

#pragma mark - initialization methods

+(id)gameWordWithWord:(NSString *)aWord
{
    return [[self alloc] initWithWord:aWord];
}


-(id)initWithWord:(NSString *)aWord
{
    self = [super init];
    if (self){
        self.theWord = aWord;
    }
    return self;
}


@end