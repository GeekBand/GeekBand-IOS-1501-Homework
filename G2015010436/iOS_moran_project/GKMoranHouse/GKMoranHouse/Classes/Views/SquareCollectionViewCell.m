//
//  SquareCollectionViewCell.m
//  GKMoranHouse
//
//  Created by house on 15/8/20.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "SquareCollectionViewCell.h"

@implementation SquareCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return  self;
}
-(void)initView{
    
    //imageView
    self.placeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 190)];
    [self addSubview:self.placeImageView];
    self.placeImageView.image = [UIImage imageNamed:@"publish.png"];
    self.commentTV = [[UITextView alloc] initWithFrame:CGRectMake(0, 208, 280, 90)];
    [self addSubview:self.placeImageView];
    self.commentTV.text = @"这是深圳一家非常好吃的小吃店快点过来尝一尝啊";
//    //选中时显示的图]片
//    imgview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 15, self.bounds.size.width-10, self.bounds.size.width-10)];
//    imgview.image = [UIImage imageNamed:@"chack.png"];
//    [self addSubview:imgview];
//    
//    //日期
//    day_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, self.bounds.size.width, self.bounds.size.width-10)];
//    day_lab.textAlignment = NSTextAlignmentCenter;
//    day_lab.font = [UIFont systemFontOfSize:14];
//    [self addSubview:day_lab];
//    
//    //农历
//    day_title = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-15, self.bounds.size.width, 13)];
//    day_title.textColor = [UIColor lightGrayColor];
//    day_title.font = [UIFont boldSystemFontOfSize:10];
//    day_title.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:day_title];

}
@end
