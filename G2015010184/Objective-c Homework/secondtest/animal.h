//
//  animal.h
//  objective-chw
//
//  Created by 盛钰 on 15/8/13.
//  Copyright (c) 2015年 shengyu. All rights reserved.
//

#ifndef objective_chw_animal_h
#define objective_chw_animal_h


#endif

typedef enum {
    male,female
}sextype;

@interface animal : NSObject

@property (readonly) sextype sex;
@property (readwrite)NSString* name;
@property (readonly)NSInteger weight;

+(NSString*) sound;
-(id) initWithName: (NSString*) animalName animalType:(NSString*)myAnimalType;

@end