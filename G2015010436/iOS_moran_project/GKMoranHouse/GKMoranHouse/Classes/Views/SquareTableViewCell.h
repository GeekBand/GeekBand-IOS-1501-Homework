//
//  SquareTableViewCell.h
//  GKMoranHouse
//
//  Created by house on 15/8/20.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <UIKit/UIKit.h>
#import   "SquareCollectionViewCell.h"
@interface SquareTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UICollectionView *squareCollectionView;


@end
