//
//  test3ViewController.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "test3ViewController.h"
#import "test3AddContentViewController.h"
#import "test3ShowContentViewController.h"
@interface test3ViewController ()

@end

@implementation test3ViewController

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _messageArray = [[NSMutableArray alloc] initWithCapacity:5];
    [self createMessageData];
    
    self.navigationItem.title = @"同学录";
    
    UIBarButtonItem *editButton
    = [[UIBarButtonItem alloc] initWithTitle:@"添加用户"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(editButtonClicked:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor clearColor];
    bgImageView.image = [UIImage imageNamed:@"bgFive"];
    [self.view addSubview:bgImageView];
    
//    NSString* cachepath = [NSHomeDirectory()stringByAppendingString:@"Douments"];
//    
//    NSLog(@"%@",cachepath);
//    
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 100) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    headerView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = headerView;
    
    UILabel *oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    oneLabel.backgroundColor = [UIColor lightGrayColor];
    oneLabel.text = @"头像";
    oneLabel.textColor = [UIColor blackColor];
    oneLabel.font = [UIFont boldSystemFontOfSize:16];
    oneLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:oneLabel];
    
    UILabel *twoLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 130, 60)];
    twoLabel.backgroundColor = [UIColor grayColor];
    twoLabel.text = @"姓名";
    twoLabel.textColor = [UIColor blackColor];
    twoLabel.font = [UIFont boldSystemFontOfSize:16];
    twoLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:twoLabel];
    
    UILabel *threeLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 0, self.view.bounds.size.width - 190, 60)];
    threeLabel.backgroundColor = [UIColor lightGrayColor];
    threeLabel.text = @"备注";
    threeLabel.textColor = [UIColor blackColor];
    threeLabel.font = [UIFont boldSystemFontOfSize:16];
    threeLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:threeLabel];
    
}
- (void)editButtonClicked:(UIBarButtonItem *)editButton {
    test3AddContentViewController *subViewController1 = [[test3AddContentViewController alloc] init];
    subViewController1.delegate = self;
    [self.navigationController pushViewController:subViewController1 animated:YES];
}

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

#pragma tableView


- (void)createMessageData {
    NSString *jordanPath = [[NSBundle mainBundle] pathForResource:@"jordan" ofType:@"png"];
    NSString *jamesPath = [[NSBundle mainBundle] pathForResource:@"james" ofType:@"png"];
    NSString *anthonyPath = [[NSBundle mainBundle] pathForResource:@"anthony" ofType:@"png"];
    NSString *kobePath = [[NSBundle mainBundle] pathForResource:@"kobe" ofType:@"png"];
    NSString *durantPath = [[NSBundle mainBundle] pathForResource:@"durant" ofType:@"png"];
    
    
    
    
    
    [_messageArray addObject:[LYTest3Message  messageWithphoto:[LYTest3User headImagePath:jordanPath]
                                                              text:@"迈克尔·乔丹（MichaelJordan），1963年2月17日生于纽约布鲁克林，美国著名篮球运动员，司职得分后卫，历史上最伟大的篮球运动员。1984年的NBA选秀大会，乔丹在首轮第3顺位被芝加哥公牛队选中。[1]  1986-87赛季，乔丹场均得到37.1分，首次获得分王称号。[1]  1990-91赛季，乔丹连夺常规赛MVP和总决赛MVP称号，率领芝加哥公牛首次夺得NBA总冠军。[1]  1997-98赛季，乔丹获得个人职业生涯第10个得分王，并率领公牛队第六次夺得总冠军。[1]  2009年9月11日，乔丹正式入选NBA名人堂。[2] " name:@"Jordan"]];
    [_messageArray addObject:[LYTest3Message    messageWithphoto:[LYTest3User headImagePath:jamesPath]
                                                            text:@"勒布朗·詹姆斯，1984年12月30日出生在美国·俄亥俄州·克里夫兰，美国男子职业篮球运动员，司职小前锋，现效力于克利夫兰骑士队。勒布朗·詹姆斯在2003年的NBA选秀大会中，首轮第一顺位被克利夫兰骑士队选中。2003-2010年，詹姆斯在骑士队效力7年，期间获得两届NBA最有价值球员（MVP）。2010年转会至迈阿密热火队，与德怀恩·韦德、克里斯·波什组成“三巨头”阵容。2012年，勒布朗·詹姆斯收获了个人在NBA的第三座最有价值球员奖，亦于同年获得了NBA生涯第一个总冠军并加冕总决赛MVP。当年夏天，勒布朗·詹姆斯代表美国男篮获得了伦敦奥运会金牌，追平了迈克尔·乔丹在1992年所创的纪录。2013年，他再度获得NBA总冠军、完成两连冠，并连续两年包揽常规赛和总决赛MVP。2014-15赛季，勒布朗·詹姆斯回归克利夫兰骑士队。"
                                                              name:@"James"]];
    [_messageArray addObject:[LYTest3Message  messageWithphoto:[LYTest3User headImagePath:anthonyPath]
                                                          text:@"卡梅隆·安东尼（Carmelo Anthony），男， 1984年5月29日出生于美国纽约市布鲁克林区（Brooklyn， New York），美国职业篮球运动员，司职小前锋，效力于NBA纽约尼克斯队。2003年，卡梅隆·安东尼在拿下NCAA总冠军后，参加了当年的NBA选秀大会，并且在第一轮第三顺位被丹佛掘金队选中。在效力于掘金队时期带领球队年年打入NBA季后赛，2009年还帮助球队自1985年来第一次晋级到西部决赛。2012-13赛季，荣膺NBA常规赛得分王。作为美国男篮“梦之队”成员，分别在2004年雅典奥运会获得铜牌，2008年北京奥运会以及2012年伦敦奥运会上获得金牌。" name:@"Anthony"]];
    [_messageArray addObject:[LYTest3Message  messageWithphoto:[LYTest3User headImagePath:kobePath]
                                                          text:@"科比·布莱恩特（1978年8月23日－），美国职业篮球运动员，自1996年起效力于NBA洛杉矶湖人队，是前NBA篮球运动员乔·布莱恩特的儿子。科比是NBA最好的得分手之一，突破、投篮、罚球、三分球他都驾轻就熟，几乎没有进攻盲区，单场比赛81分的个人纪录就有力的证明了这一点。除了疯狂的得分外，科比的组织能力也很出众，经常担任球队进攻的第一发起人。另外科比还是联盟中最好的防守人之一，贴身防守非常具有压迫性"
                                                              name:@"Kobe"]];
    [_messageArray addObject:[LYTest3Message  messageWithphoto:[LYTest3User headImagePath:durantPath]
                                                          text:@"凯文·杜兰特（Kevin Durant 1988年9月29日—），男，美国职业篮球运动员，司职小前锋，效力于俄克拉荷马雷霆队。杜兰特在2007年选秀首轮第二顺位被西雅图超音速队选中[1]  ，2008年随球队搬迁到俄克拉何马州。2010年，21岁的杜兰特成为NBA史上最年轻得分王[2]  ，之后又连续2个赛季荣膺NBA常规赛得分王。2014年，杜兰特同时获得得分王与NBA常规赛最有价值球员奖"
                                                              name:@"Durant"]];
  //  [_messageArray addObject:[LYTest3Message  messageWithphotoPath:@"cat" text:@"i123" name:@"wade"]];
    //[_messageArray addObject:[LYTest3Message  messageWithphotoPath:@"cat" text:@"i123" name:@"wade"]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [_messageArray count];
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_messageArray count] > indexPath.row) {
//        LYTest3Message *message = (LYTest3Message *)[_messageArray objectAtIndex:indexPath.row];
//        return [LYTest3CustomCell calculateCellHeightWithMessage:message];
        return 140;
    }
    return 0;//多余不显示
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    LYTest3CustomCell *cell = (LYTest3CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[LYTest3CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.delegate = self;
    }
    
    [cell cleanComponents];
    
    if ([_messageArray count] > indexPath.row) {
        LYTest3Message *message = [_messageArray objectAtIndex:indexPath.row];
        [cell setComponentsWithMessage:message indexPath:indexPath];
        [cell setHeadImage:[UIImage imageWithContentsOfFile:message.sender.headImagePath]];

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    test3ShowContentViewController *subViewController2 = [[test3ShowContentViewController alloc] init];
    [self.navigationController pushViewController:subViewController2 animated:YES];
    LYTest3Message *message = [_messageArray objectAtIndex:indexPath.row];
    [subViewController2 setComponentsWithMessage:message indexPath:indexPath];
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
//    if (editingStyle == UITableViewCellEditingStyleInsert) {
//        LYTest1User *user = [LYTest1User userWithName:@"12345" headImagePath:nil lifePhotoPath:nil];
//        LYTest1Message *message = [LYTest1Message messageWithSender:user text:@"1234567890-esrdfghjkl;" sendDate:[NSDate date] sendSpeaker:@"2"];
//        [_messageArray insertObject:message atIndex:indexPath.row];
//        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
//                         withRowAnimation:UITableViewRowAnimationLeft];
//    }else if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_messageArray removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
//    }
//    //        [tableView reloadData];
}




-(void)inputButtonClicked:(test3AddContentViewController *)addContent{
    //read from sand box
    NSArray *paths2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir2 = [paths2 objectAtIndex:0];
    NSString *filePath2 = [docDir2 stringByAppendingPathComponent:@"1.txt"];
    NSString *photoPath2 = [docDir2 stringByAppendingPathComponent:@"1.png"];

    NSArray *array2 = [[NSArray alloc]initWithContentsOfFile:filePath2];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:photoPath2];
    


    NSString *text1 = [array2 objectAtIndex:0];
    NSString *text2 = [array2 objectAtIndex:1];
    NSLog(@"text1%@", text1);
    NSLog(@"text2%@", text2);
    [_messageArray addObject:[LYTest3Message messageWithphoto:[LYTest3User headImagePath:photoPath2] text:text1 name:text2]];
    
}

@end