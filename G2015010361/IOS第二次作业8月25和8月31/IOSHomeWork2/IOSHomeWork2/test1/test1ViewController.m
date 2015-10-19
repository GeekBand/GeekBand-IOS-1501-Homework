//
//  test1ViewController.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "test1ViewController.h"

@interface test1ViewController ()

@end

@implementation test1ViewController




#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _messageArray = [[NSMutableArray alloc] initWithCapacity:5];
    [self createMessageData];
    
    self.navigationItem.title = @"TOM";
    
    UIBarButtonItem *editButton
    = [[UIBarButtonItem alloc] initWithTitle:@"用户信息"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(editButtonClicked:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    self.bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.bgImageView.backgroundColor = [UIColor clearColor];
    self.bgImageView.image = [UIImage imageNamed:@"bgThree"];
    [self.view addSubview:self.bgImageView];
    
    UIImageView *inputImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height -40, self.view.bounds.size.width, 40)];
    inputImage.backgroundColor = [UIColor clearColor];
    inputImage.image = [UIImage imageNamed:@"WX2"];
    [self.view addSubview:inputImage];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height - 120) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
}


#pragma mark - custom event methods

- (void)editButtonClicked:(UIBarButtonItem *)editButton {
    _tableView.editing = !_tableView.editing;
    
    if (_tableView.editing) {
        [editButton setTitle:@"完成"];
    }else {
        [editButton setTitle:@"编辑"];
    }
}


#pragma mark - custom methods

- (void)createMessageData {
    [_messageArray addObject:[LYTest1Message messageWithSender:[LYTest1User userWithName:@"cat"
                                                                 headImagePath:[[NSBundle mainBundle]
                                                                                pathForResource:@"cat"
                                                                                ofType:@"png"]
                                                                 lifePhotoPath:[[NSBundle mainBundle]
                                                                                pathForResource:@"1"
                                                                                ofType:@"png"]]
                                                          text:@"小灰兔和小白兔帮老山羊收白菜，收完了，老山羊把一车白菜送给了它们。小灰兔高兴地说谢谢。小白兔却说：我不要白菜，你给我一些种子吧。老山羊笑嘻嘻地说：好，留下你的邮箱。"
                                                          sendDate:[NSDate date]
                                                          sendSpeaker:@"1"]];
    
    [_messageArray addObject:[LYTest1Message messageWithSender:[LYTest1User userWithName:@"mouse"
                                                                 headImagePath:[[NSBundle mainBundle]
                                                                                pathForResource:@"mouse"
                                                                                ofType:@"png"]
                                                                 lifePhotoPath:[[NSBundle mainBundle]
                                                                                pathForResource:@"1"
                                                                                ofType:@"png"]]
                                                     text:@"有架F15为B52护航，长路漫漫，闲极无聊。F15飞行员操纵飞机绕B52来了两个机动动作，说：伙计，看我的小鸟多能干，你那家伙能干的她都能干。B52：那我做个动作你学吧。F15：OK！若干分钟后，F15见B52未有任何变化，问：你干什么了？B52：我关了两台发动机，现在轮到你了。"
                                                 sendDate:[NSDate date]
                                                 sendSpeaker:@"2"]];
    
    [_messageArray addObject:[LYTest1Message messageWithSender:[LYTest1User userWithName:@"cat"
                                                                 headImagePath:[[NSBundle mainBundle]
                                                                                pathForResource:@"cat"
                                                                                ofType:@"png"]
                                                                 lifePhotoPath:[[NSBundle mainBundle]
                                                                                pathForResource:@"1"
                                                                                ofType:@"png"]]
                                                          text:@"我们在移动公司培训，听到10086客服的开除案例！一个接线员接到一个客户的电话，客户是个磕巴说话有点慢：我我我....想想想问下，我我我.......电....话话话费.......最最最近.....怎么这样费？接线员只说：大大大大哥就就就你这样能能能不费吗？之后他被开除了！"
                                                      sendDate:[NSDate date]                                            sendSpeaker:@"1"]];
    
    
    [_messageArray addObject:[LYTest1Message messageWithSender:[LYTest1User userWithName:@"cat"
                                                                 headImagePath:[[NSBundle mainBundle]
                                                                                pathForResource:@"cat"
                                                                                ofType:@"png"]
                                                                 lifePhotoPath:[[NSBundle mainBundle]
                                                                                pathForResource:@"1"
                                                                                ofType:@"png"]]
                                                          text:@"1.一个人在家看书，突然有人敲门，他一开门，看到一只特别小个的蜗牛，蜗牛说：请问我可以进去休息一下吗？那个人说：不行，然后一脚把蜗牛踹飞了。过了五十年，这个人在家看书的时候门又响了，他一开门，是一只人脑袋那么大的蜗牛，蜗牛说：你他妈踹我干嘛2.乌龟生病了，蜗牛说：你好好在家躺着，我去给你买药。乌龟躺了一星期了，蜗牛还没回来，乌龟就急了：蜗牛太不够意思了！他肯定去别处玩了！门外突然传来蜗牛的声音：你再骂我，我就他妈的不去了"
                                                      sendDate:[NSDate date]                                                 sendSpeaker:@"1"
]];
    
    
    [_messageArray addObject:[LYTest1Message messageWithSender:[LYTest1User userWithName:@"mouse"
                                                                 headImagePath:[[NSBundle mainBundle]
                                                                                pathForResource:@"mouse"
                                                                                ofType:@"png"]
                                                                 lifePhotoPath:[[NSBundle mainBundle]
                                                                                pathForResource:@"1"
                                                                                ofType:@"png"]]
                                                          text:@"从前有一只大鱼和一只小鱼。有一天 小鱼问大鱼：大～鱼～大～鱼～你～平～常～喜～欢～吃～什～么～丫。大鱼说：我～喜～欢～吃～说～话～慢～的～小～鱼。然后小鱼说：喔 酱紫 造了！"
                                                      sendDate:[NSDate date]                                                 sendSpeaker:@"2"
]];
    
}


#pragma mark - UITableViewDelegate and UITableViewDataSource methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [_messageArray count];
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_messageArray count] > indexPath.row) {
        LYTest1Message *message = (LYTest1Message *)[_messageArray objectAtIndex:indexPath.row];
        return [LYTest1CustomCell1 calculateCellHeightWithMessage:message];
    }
    return 0;//多余不显示
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    LYTest1CustomCell1 *cell = (LYTest1CustomCell1 *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[LYTest1CustomCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.delegate = self;
    }
    
   [cell cleanComponents];
    
    if ([_messageArray count] > indexPath.row) {
        LYTest1Message *message = [_messageArray objectAtIndex:indexPath.row];
        [cell setComponentsWithMessage:message indexPath:indexPath];
        [cell setHeadImage:[UIImage imageWithContentsOfFile:message.sender.headImagePath]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 1) {
        return YES;
    }
    return NO;
}

- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除此行";
}

-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        LYTest1User *user = [LYTest1User userWithName:@"12345" headImagePath:nil lifePhotoPath:nil];
        LYTest1Message *message = [LYTest1Message messageWithSender:user text:@"1234567890-esrdfghjkl;" sendDate:[NSDate date] sendSpeaker:@"2"];
        [_messageArray insertObject:message atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationLeft];
    }else if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_messageArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
    //        [tableView reloadData];
}


#pragma mark - BLCustomDelegate methods

//- (void)headButtonClicked:(LYTest1Button1 *)headButton {
//    if ([_messageArray count] > headButton.cellRow) {
//        LYTest1Message *message = (LYTest1Message *)[_messageArray objectAtIndex:headButton.cellRow];
//        LYTest1UserSpaceViewController *userSpaceViewController= [[LYTest1UserSpaceViewController alloc] init];
//        userSpaceViewController.message = message;
//        [self.navigationController pushViewController:userSpaceViewController animated:YES];
//    }
//}




















#pragma mark
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}



@end