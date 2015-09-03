//
//  GWRandom.m
//  Classmates
//
//  Created by Will Ge on 9/2/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWRandom.h"

@implementation GWRandom


+ (NSString *)createARandomName {
    
    NSString *firstName  = [NSString stringWithFormat:@"%c%c%c%c%c%c%c%c%c%c",'A' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26),'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26)];
    firstName =[firstName substringToIndex:(arc4random() % firstName.length)];
    
    NSString *lastName   = [NSString stringWithFormat:@"%c%c%c%c%c%c%c%c%c%c",'A' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26),'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26), 'a' + arc4random_uniform(26)];
    lastName = [lastName substringToIndex:(arc4random() % lastName.length)];
    
    NSString *randomName = [firstName stringByAppendingString:@" "];
    randomName           = [randomName stringByAppendingString:lastName];
    
    return randomName;
}

+ (NSString *)createARandomText {
    
    NSString *randomText = [[NSString alloc] init];
    
    // a random number sentances
    for (int i = 1; i < MAX(3, arc4random_uniform(50)) ; i++) {
        
        // A sentance
        
        // First word with space of a sentance
        randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@" %c",'A' + arc4random_uniform(26)]];
        
        for (int j = 1; j < MAX(3, arc4random_uniform(15)); j++) {
            
            randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@"%c",'a' + arc4random_uniform(26)]];
            
        }
        
        randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@" "]];
        
        
        // middle of a sentance
        for (int k = 1; k < MAX(3, arc4random_uniform(20)); k++) {
            
            // middle word with space of a sentance
            for (int l = 1; l < MAX(3, arc4random_uniform(15)); l++) {
                
                randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@"%c",'a' + arc4random_uniform(26)]];
                
            }
            
            randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@" "]];
            
        }
        
        
        // Last word with punctuation and sapce of a sentance
        randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@" %c",'A' + arc4random_uniform(26)]];
        
        for (int m = 1; m < MAX(3, arc4random_uniform(10)); m++) {
            
            randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@"%c",'a' + arc4random_uniform(26)]];
            
        }
        
        NSString *punctuation = @".?!;";
        punctuation = [punctuation substringWithRange:NSMakeRange(arc4random() % [punctuation length], 1)];
        
        randomText = [randomText stringByAppendingString:punctuation];
        
        randomText = [randomText stringByAppendingString:[NSString stringWithFormat:@" "]];
        
    }
    
    // Remove the space of text
    randomText = [randomText substringWithRange:NSMakeRange(0, randomText.length - 1)];
    
    return randomText;
    
}

@end
