//
//  ViewController.m
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/2.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "ViewController.h"
#import <mach/mach_time.h>

@interface ViewController () {
    NSInteger _imageCounter;
    uint64_t _startTime;
    uint64_t _endTime;
}

@property (copy, nonatomic) NSArray *gameAttributes;      //装着一个个的GameAttributes...

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WebRequest *request = [[WebRequest alloc] init];
    request.delegate = self;
    _startTime = mach_absolute_time();
    [request startARequestWithURL:[NSURL URLWithString:LOADING_URL]];
    _presentTableView.rowHeight = UITableViewAutomaticDimension;
    _presentTableView.estimatedRowHeight = 70;
    _presentTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

double subtractTimes(uint64_t endTime, uint64_t startTime )
{
    uint64_t difference = endTime - startTime;
    static double conversion = 0.0;
    if( conversion == 0.0 )
    {
        mach_timebase_info_data_t info;
        kern_return_t err =mach_timebase_info( &info );
        //Convert the timebase into seconds
        if( err == 0  )
            conversion= 1e-9 * (double) info.numer / (double) info.denom;
    }
    return conversion * (double)difference;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_gameAttributes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"GameIntroTableViewCell";
    GameAttributes *attribute = (GameAttributes *)_gameAttributes[indexPath.row];
    GameIntroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[GameIntroTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.gameIcon.image = attribute.image;
    cell.gameName.text = attribute.name;
    [self viewWillLayoutSubviews];
    return cell;
}

#pragma mark - WebRequestDelegate methods

- (void)handleReceivedData:(NSData *)data {
    _endTime = mach_absolute_time();
    double elapsed = subtractTimes(_endTime, _startTime);
    printf("下载数据使用了%.2lf秒\n",elapsed);
#ifdef JSON
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _startTime = mach_absolute_time();
        JSONParser *parser = [[JSONParser alloc] init];
        _gameAttributes = [parser parseAJSONData:data];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self startLoadingImages];
        });
    });
#else
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _startTime = mach_absolute_time();
        XMLParser *parser = [[XMLParser alloc] init];
        parser.delegate = self;
        [parser parseAXMLData:data];
    });
#endif
}

- (void)startLoadingImages {
    _endTime = mach_absolute_time();
    double elapsed = subtractTimes(_endTime, _startTime);
    printf("解析数据使用了%.4lf秒\n",elapsed);
    WebRequest *request = [[WebRequest alloc] init];
    request.delegate = self;
    GameAttributes *attributes = (GameAttributes *)_gameAttributes[0];
    [request startARequestWithURL:[NSURL URLWithString:attributes.imageAddress]];
}

- (void)handleImageData:(NSData *)data {
    UIImage *image = [UIImage imageWithData:data];
    GameAttributes *attribute = (GameAttributes *)_gameAttributes[_imageCounter];
    attribute.image = image;
    ++_imageCounter;
    if (_imageCounter == [_gameAttributes count]) {
        [_presentTableView reloadData];
        Author *author = [Author sharedAuthor];
        self.title = author.name;
    }else {
        attribute = (GameAttributes *)_gameAttributes[_imageCounter];
        WebRequest *request = [[WebRequest alloc] init];
        request.delegate = self;
        [request startARequestWithURL:[NSURL URLWithString:attribute.imageAddress]];
    }
}

#pragma mark - XMLParserDelegate

- (void)finishParsingAndReturnGamesAttributes:(NSArray *)gamesAttributes {
    _gameAttributes = gamesAttributes;
    [self startLoadingImages];
}

@end
