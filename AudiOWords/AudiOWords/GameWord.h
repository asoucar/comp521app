//
//  gameWord.h
//  AudiOWords
//
//  Created by Ashley Soucar on 9/26/12.
//  Copyright (c) 2012 Spellers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface GameWord : NSObject

@property (nonatomic, retain) NSString *theWord;
@property (nonatomic, retain) UIImage *wordImage;
@property (nonatomic, retain) NSMutableArray *letters;
@property (nonatomic, retain) NSMutableDictionary *sounds;

+(id)gameWordWithWord:(NSString *)aWord;

//-(id)initWithWord:(NSString *)aWord;
-(void)playHappySound;
-(void)playSadSound;

@end
