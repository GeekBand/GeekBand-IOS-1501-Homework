//
//  TAnimal.m
//  test0808
//
//  Created by snddfhv on 15/8/10.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "TAnimal.h"

@implementation TAnimal

- (TAnimal *)initWithName:(NSString *)name andGender:(TAnimalGender)gender andWeight:(float)weight {
    self = [super init];
    if (self) {
        [self setName:name];
        [self setGender:gender];
        [self setWeight:weight];
    }
    return self;
}

- (void)yelp {
    NSLog(@"动物发出叫声。。。");
}
@end
