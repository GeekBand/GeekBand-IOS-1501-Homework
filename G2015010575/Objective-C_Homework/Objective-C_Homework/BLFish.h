//
//  BLFish.h
//  
//
//  Created by 祝海焜 on 15/9/5.
//
//

#import "BLAnimal.h"
#import <UIKit/UIKit.h>

@interface BLFish : BLAnimal

@property (nonatomic, strong)UIColor *color;

-(id)initWithName:(NSString *)name weight:(NSInteger)weight sex:(SEX)sex color:(UIColor *)color;

- (void)swim;

@end
