## 1、设计一个动物基类。

要求:

A、抽象出动物的基本属性(包括:性别、名字、体重)。

B、抽象出动物的基本能力(包括:发声)。

C、基本属性性别用枚举定义。

> 注意点：使用了 NS_ENUM 宏定义枚举

### GBAnimal.h

``` objc
@interface GBAnimal : NSObject

typedef NS_ENUM(NSInteger, Gender) {
    GenderMale,
    GenderFemale
};

//名称
@property(nonatomic,copy) NSString *name;

//性别
@property(assign) Gender gender;

//体重
@property(assign) NSInteger weight;

-(instancetype) initWithName:(NSString *) name;
-(void) sound:(NSString *) sound;

@end
```

### GBAnimal.m

``` objc
@implementation GBAnimal

-(instancetype) initWithName:(NSString *) name {   
    if (self = [super init]) {
        self.name=name;
        self.gender=gender;
        self.weight=weight;
    }
    return self;
}

-(void) sound:(NSString *) sound {
    NSLog(@"%@",sound);
}
@end
```



## 2、由题目 1 设计好的动物基类继承,设计一个新的鸟和鱼的子类。

要求:

A、鸟类需要扩展颜色属性。

B、鸟类需要扩展飞的方法(方法体输出打印出飞行状态即可)。

C、鱼类需要扩展颜色属性。

D、鱼类需要扩展出游的方法(方法体输出打印游的状态即可)。

### GBBird.h & GBBird.m

```objc
#import "GBAnimal.h"

@interface GBBird : GBAnimal
@property (nonatomic, copy) NSString *color;
- (void)fly;
@end

@implementation GBBird
- (void)fly {
    NSLog(@"飞ing");
}
@end
```

### GBFish.h & GBFish.m

```objc
#import "GBAnimal.h"

@interface GBFish : GBAnimal
@property(nonatomic,copy)NSString *color;
-(void)swim;
@end

@implementation GBFish
-(void)swim {
    NSLog(@"游ing");
}
@end
```



## 3、设计好 1、2 两个题目要求的类后,创建一个数组。使用一个循环,生成 10只鸟、10 条鱼的对象,并将 10 只鸟、10 条鱼的对象加入到创建好的数组中。最后,遍历这个数组对象,遍历到鸟对象时调用鸟儿飞的方法,遍历到鱼对象时调用鱼儿游的方法。

>注意点：使用了 fast enumeration

```objc
#include "GBAnimal.h"
#include "GBBird.h"
#include "GBFish.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *array=[[NSMutableArray alloc] init];
        for (int i=1; i<11; i++) {
            GBFish *fish=[[GBFish alloc] initWithName:[NSString stringWithFormat:@"fish%2d",i]];
            [array addObject:fish];
        }
        for (int i=1; i<11; i++) {
            GBBird *bird=[[GBBird alloc] initWithName:[NSString stringWithFormat:@"bird%2d",i]];
            [array addObject:bird];
        }
        
        
        for (id eachObject in array) {
            if ([eachObject isMemberOfClass:[GBBird class]]) {
                [eachObject fly];
            }
            else {
                [eachObject swim];
            }
        }
        
        //第4题占位符
        
    }
    return 0;
}
```



## 4 考虑游戏中捞鱼, 随机器捞到 n 条鱼,纪录数量(被捞到的鱼认为对象的生命周期结束,需要从内存中释放)。打鸟同理。

>ARC中不能使用release或dealloc释放对象，要释放对象，指针指向nil即可，这里使用了自带的方法

```
NSUInteger r = arc4random_uniform(10)+1;
NSLog(@"%ld条鱼被捕了",r);
[array removeObjectsInRange:NSMakeRange(0, r)];
```

