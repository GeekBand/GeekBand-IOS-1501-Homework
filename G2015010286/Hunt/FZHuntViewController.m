//
//  FZHuntViewController.m
//  Hunt
//
//  Created by Flame on 15/8/8.
//  Copyright © 2015年 Flame. All rights reserved.
//

#import "FZHuntViewController.h"

@interface FZHuntViewController (){
    //NSMutableArray *_animals;
}

@end

@implementation FZHuntViewController

#pragma mark - View's Lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animals = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 10 ; i++) {
        FZBirds *bird = [[FZBirds alloc] init];
        FZFishes *fish = [[FZFishes alloc] init];
        [_animals addObject:bird];
        [_animals addObject:fish];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    UIImage *image = [UIImage imageNamed:@"bg2"];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *huntBird = [[UIButton alloc] initWithFrame:CGRectMake(10, 74, self.view.bounds.size.width - 20, 44)];
    huntBird.backgroundColor = [UIColor greenColor];
    [huntBird setTitle:@"huntBird" forState:UIControlStateNormal];
    [huntBird addTarget:self action:@selector(huntBirdButtom:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:huntBird];
    
    UIButton *huntFish = [[UIButton alloc] initWithFrame:CGRectMake(10, 128, self.view.bounds.size.width - 20, 44)];
    huntFish.backgroundColor = [UIColor redColor];
    [huntFish setTitle:@"huntFish" forState:UIControlStateNormal];
    [huntFish addTarget:self action:@selector(huntFishButtom:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:huntFish];
    
    UIButton *reloadGame = [[UIButton alloc] initWithFrame:CGRectMake(10, 182, self.view.bounds.size.width - 20, 44)];
    reloadGame.backgroundColor = [UIColor blackColor];
    [reloadGame setTitle:@"reloadGame" forState:UIControlStateNormal];
    [reloadGame addTarget:self action:@selector(initDataButtom:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reloadGame];
}

#pragma mark - Init

- (void)initData{
    self.animals = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 10 ; i++) {
        FZBirds *bird = [[FZBirds alloc] init];
        FZFishes *fish = [[FZFishes alloc] init];
        [_animals addObject:bird];
        [_animals addObject:fish];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reload successed!" message:@"We have reload 20 animals" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - User Methods

- (IBAction)huntBirdButtom:(id)sender{
    NSLog(@"huntBird");
    NSInteger huntNumber = (arc4random() % 10) +1;
    [self huntBird:huntNumber inArrary:self.animals];
}

- (IBAction)huntFishButtom:(id)sender{
    NSLog(@"huntFish");
    NSInteger huntNumber = (arc4random() % 10) +1;
    [self huntFish:huntNumber inArrary:self.animals];
}

- (IBAction)initDataButtom:(id)sender{
    [self initData];
    NSLog(@"reload");
}

- (void)moveAnimal:(id)animal{
    if ([[animal class]  isKindOfClass:[FZFishes class]]) {
        FZFishes *fish = (FZFishes *)animal;
        [fish fishSwim];
    } else if ([[animal class] isKindOfClass:[FZBirds class]]){
        FZBirds *bird = (FZBirds *)animal;
        [bird birdsFly];
    }
}

- (void)huntBird:(NSInteger)number inArrary:(NSMutableArray *)arrary{
    NSInteger count = [arrary count];
    NSInteger currentBirdNumber = 0;
    NSInteger huntedNumber = 0;
    NSInteger leftNumber = 0;
    for (NSInteger i = 0; i < count; i++) {
        if ([arrary[i] isMemberOfClass:[FZBirds class]]){
            currentBirdNumber++;
        }
    }
    if (number <= currentBirdNumber) {
        for (NSInteger i = count - 1; i > 0; i--) {
            FZAnimals *animal = arrary[i];
            if ([animal  isMemberOfClass:[FZBirds class]]){
                huntedNumber++;
                [arrary removeObjectAtIndex:i];
                if (huntedNumber == number) {
                    leftNumber = currentBirdNumber - number;
                    NSString *message = [NSString stringWithFormat:@"You have hunted %li fishes, there is left %li birds" , huntedNumber, leftNumber];
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hunt successed!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    break;
                }
            }
        }
        
    } else {
        NSLog(@"not enough");
        NSString *message = [NSString stringWithFormat:@"You need hunt %li birds ,but there is Not enough birds" , number];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hunt failed!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
}

- (void)huntFish:(NSInteger)number inArrary:(NSMutableArray *)arrary{
    NSInteger count = [arrary count];
    NSInteger currentFishNumber = 0;
    NSInteger huntedNumber = 0;
    NSInteger leftNumber = 0;
    for (NSInteger i = 0; i < count; i++) {
        if ([arrary[i] isMemberOfClass:[FZFishes class]]){
            currentFishNumber++;
        }
    }
    if (number <= currentFishNumber) {
        NSLog(@"ok");
        for (NSInteger i = count - 1; i > 0; i--) {
            FZAnimals *animal = arrary[i];
            if ([animal  isMemberOfClass:[FZFishes class]]){
                huntedNumber++;
                //NSLog(@"You have hunted %li fishes" , huntedNumber);
                [arrary removeObjectAtIndex:i];
                if (huntedNumber == number) {
                    leftNumber = currentFishNumber - number;
                    NSString *message = [NSString stringWithFormat:@"You have hunted %li fishes, there is left %li fishes" , huntedNumber, leftNumber];
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hunt successed!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    break;
                }
            }
        }
        
    } else {
        NSLog(@"not enough");
        NSString *message = [NSString stringWithFormat:@"You need hunt %li fishes ,but there is Not enough birds" , number];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hunt failed!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
