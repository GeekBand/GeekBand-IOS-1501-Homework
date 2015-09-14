//
//  ViewController.h
//  GeekbandTest01
//
//  Created by huzhigang on 15/8/8.
//  Copyright © 2015年 huzhigang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bird.h"
#import "Fish.h"

@interface ViewController : UIViewController
{
    NSMutableArray *_fishAndbirds;
}

- (IBAction)MakeAnimal:(id)sender;
- (IBAction)GetFish:(id)sender;



@end

