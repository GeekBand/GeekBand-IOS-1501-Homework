//
//  HWFish.h
//  G2015010103_Homework
//
//  Created by 李凌霄 on 15/8/12.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HWAnimalGender) {
	HWAnimalGenderUndefined,		//未定义
	HWAnimalGenderHermaphrodite, 	//雌雄同体
	HWAnimalGenderMale,				//雄性
	HWAnimalGenderFemale			//雌性
};

@interface HWAnimal : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) HWAnimalGender gender;
@property (nonatomic, assign) double weight;

- (void)cry;

@end
