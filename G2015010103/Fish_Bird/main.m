//
//  main.m
//  Fish_Bird
//
//  Created by 李凌霄 on 15/8/12.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "HWAnimal.h"
#import "HWBird.h"
#import "HWFish.h"
#import "UIColor+randomColor.h"

static NSUInteger const HWAnimalArrayCapacity = 20;

int main(int argc, char * argv[]) {
	@autoreleasepool {
		//初始化animals数组，养鱼养鸟
		NSMutableArray *animals = [NSMutableArray arrayWithCapacity:HWAnimalArrayCapacity];
		for (int i = 0; i < HWAnimalArrayCapacity; i++) {
			if (i % 2) { //偶数鸟
    			HWBird *bird = [[HWBird alloc] init];
				bird.name = [bird.name stringByAppendingString:[NSString stringWithFormat:@"-%d", (i + 1) / 2]];
				bird.color = [UIColor randomColor];
				[animals addObject:bird];
			} else {	//奇数鱼
				HWFish *fish = [[HWFish alloc] init];
				fish.name = [fish.name stringByAppendingString:[NSString stringWithFormat:@"-%d", (i + 2) / 2]];
				fish.color = [UIColor randomColor];
//				fish.weight = arc4random() % 2000;
				[animals addObject:fish];
			}
		}
		
		//遍历数组 - 鱼儿游，鸟儿飞
		NSLog(@"开始遍历动物数组…");
		for (id animal in animals) {
			if ([[animal class] isSubclassOfClass:[HWBird class]]) {
				HWBird *aBird = (HWBird *)animal;
				[aBird fly];
			} else if ([[animal class] isSubclassOfClass:[HWFish class]]) {
				HWFish *aFish = (HWFish *)animal;
				[aFish swim];
			}
			
		}
		
		//修改数组 - 抓鱼抓鸟
		NSLog(@"开始抓鱼抓鸟…");
		NSMutableIndexSet *huntedAnimalIndexSet = [[NSMutableIndexSet alloc] init];	//被捕动物下标集合
		NSUInteger numberOfAnimalsHunted = arc4random() % HWAnimalArrayCapacity;	//被捕动物总数。范围:[0, HWAnimalArrayCapacity - 1]
		if (numberOfAnimalsHunted == 0) {
			NSLog(@"No animal has been hunted. Peace!");
		}else{
			for (int i = 0; i < numberOfAnimalsHunted; i++) { 			//生成被捕动物下标集合
				NSUInteger idx = arc4random() % HWAnimalArrayCapacity;	//被捕动物下标。范围:[0, HWAnimalArrayCapacity -1]
				[huntedAnimalIndexSet addIndex:idx];					//由于是Set，因此元素不会重复(?)
			}
		}
//		NSArray *animalsHunted = [animals objectsAtIndexes:huntedAnimalIndexSet]; //根据被捕动物下标集合，取出原动物数组里相应的元素，放入新的数组中
//		for (id animal in animalsHunted) {
//			if ([[animal class] isSubclassOfClass:[HWBird class]]) {
//				HWBird *aBird = (HWBird *)animal;
//				[aBird fly];
//			} else if ([[animal class] isSubclassOfClass:[HWFish class]]) {
//				HWFish *aFish = (HWFish *)animal;
//				[aFish swim];
//			}
//		} //此方法不能将原animals数组元素释放，而只是操作其副本，虽其余功能可用，但不符合题意，弃用。
		
		__block NSUInteger fishesHunted, birdsHunted = 0; 	//为了让这两个计数器能够在block内部被修改，需要加上__block修饰符
		[huntedAnimalIndexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) { //根据huntedAnimalIndexSet里的所有下标，对animals执行block里的方法
			id animalAtIdx = [animals objectAtIndex:idx];
			if ([[animalAtIdx class] isSubclassOfClass:[HWBird class]]) {
				birdsHunted++;
			} else if ([[animalAtIdx class] isSubclassOfClass:[HWFish class]]) {
				fishesHunted++;
			}
			[animals removeObjectAtIndex:idx];		//每次枚举都会释放一个数组元素，系统会调用该元素的dealloc方法（已override输出“xxx has been hunted.”）
			[animals insertObject:@"" atIndex:idx]; //为了避免数组缩小后idx越界（即使不越界，idx也指向错误的元素），因此插入一个空NSString占位
		}];
		
		NSLog(@"捕获了%lu条鱼，%lu只鸟。",(unsigned long)fishesHunted, (unsigned long)birdsHunted);
		NSLog(@"程序结束。下面是autoreleasepool自动垃圾清理时间，请忽略输出…");
		NSLog(@"-----------------------");
		return 0;
//		return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
