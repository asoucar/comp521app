//
//  gameWord.h
//  AudiOWords
//
//  Created by Ashley Soucar on 9/26/12.
//  Copyright (c) 2012 Spellers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameWord : NSObject

@property (nonatomic, retain) NSString *theWord;
@property (nonatomic, retain) UIImage *pic;
@property (nonatomic, retain) NSMutableArray *letters;

+(id)gameWordWithWord:(NSString *)aWord;

-(id)initWithWord:(NSString *)aWord;

@end
