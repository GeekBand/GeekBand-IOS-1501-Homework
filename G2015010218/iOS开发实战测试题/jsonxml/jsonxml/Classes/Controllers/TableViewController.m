//
//  TableViewController.m
//  jsonxml
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//


#define ENTRY_JSON_URL @"http:ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json"
#define ENTRY_XML_URL @"http:ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/xml"

#import "TableViewController.h"
#import "ZOPGETDataRequest.h"
#import "ZOPParserData.h"
#import "ZOPEntry.h"
#import "ZOPEntryCell.h"

@interface TableViewController ()
/** 条目 */
@property (nonatomic, copy) NSArray *entrys;
/** 网络请求 */
@property (nonatomic, strong) ZOPGETDataRequest *request;
/** 解析器 */
@property (nonatomic, strong) ZOPParserData *parser;
/** 图片内存缓存 */
@property (nonatomic, strong) NSCache *imageCaches;
/** 请求起飞数组 */
@property (nonatomic, strong) NSMutableArray *requestings;


- (IBAction)jsonParser:(UIBarButtonItem *)sender;

- (IBAction)xmlParser:(UIBarButtonItem *)sender;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entrys.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ZOPEntryCell";
    
    ZOPEntryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    ZOPEntry *entry = self.entrys[indexPath.row];
    
    cell.productNameLabel.text = entry.name;
    cell.productPrice.text = entry.price;
    cell.productTypeLabel.text = entry.type;
    cell.productSummaryLabel.text = entry.summary;
    
    UIImage *imageCache = [self.imageCaches objectForKey:entry.imageURL];
    __weak typeof(self) weakSelf = self;
    if (!imageCache)
    {
        // 重用的图片清空
        cell.iconView.image = nil;
        
        // 请求起飞判断
        for (NSString *imageURL in self.requestings) {
            if ([imageURL isEqualToString:entry.imageURL]) {
                // 不往下走
                return cell;
            }
            else
            {
                [weakSelf.requestings addObject:entry.imageURL];
            }
        }
        
        [self.request downloadTaskWithURL:entry.imageURL requestFinished:^(NSURL *location, NSError *error)
         {
             dispatch_async(dispatch_get_main_queue(), ^
             {
                 if (location && error == nil)
                 {
                     NSData *imageData = [NSData dataWithContentsOfURL:location];
                     
                     if (imageData.length > 0) {
                         UIImage *image = [[UIImage alloc] initWithData:imageData];
                         if (image)
                         {
                             cell.iconView.image = image;
                             // 记录图片缓存
                             [weakSelf.imageCaches setObject:image forKey:entry.imageURL];
                             [weakSelf.requestings removeObject:entry.imageURL];
                         }
                     }
                 }
             });
             
         }];
    }
    else
    {
        cell.iconView.image = imageCache;
    }
    
    return cell;
}

#pragma mark - TableView Delegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZOPEntry *entry = self.entrys[indexPath.row];
    
    CGFloat imageHeight = 80;
    
    CGSize boundingSize = CGSizeMake(self.tableView.frame.size.width - 32, CGFLOAT_MAX);
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
    CGSize summarySize = [entry.summary boundingRectWithSize:boundingSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    return summarySize.height + imageHeight + 25;
}



#pragma mark - Public Methods
- (IBAction)jsonParser:(UIBarButtonItem *)sender
{
    [self getEntryWithURL:ENTRY_JSON_URL];
}

- (IBAction)xmlParser:(id)sender
{
    [self getEntryWithURL:ENTRY_XML_URL];
}

#pragma mark - Private Methods
/** 取数据 */
- (void) getEntryWithURL:(NSString *)urlStr
{
    __weak typeof(self) weakSelf = self;
    [self.request dataTaskWithURL:urlStr parameter:nil requestFinished:^(NSData *data, NSError *error) {
        if (data.length > 0 && error == nil) {
            // 请求成功
            [weakSelf parserData:data withURL:urlStr];
            
        }
        else
        {
            // 请求失败
            NSLog(@"error : %@",[error localizedDescription]);
        }
        
        // 请求完释放请求对象
        weakSelf.request = nil;
    }];
}

/** 解析data数据 */
- (void) parserData:(NSData *)data withURL:(NSString *)urlStr
{
    __weak typeof(self) weakSelf = self;
    if ([urlStr isEqualToString:ENTRY_JSON_URL]) {
        // 解析json
        [weakSelf.parser parserJSONData:data finished:^(id modelObj, NSError *error) {
            // 主线程更新ui
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([modelObj isKindOfClass:[NSArray class]] && error == nil) {
                    weakSelf.entrys = modelObj;
                    [weakSelf.tableView reloadData];
                }
                // 解析完释放解析器
                weakSelf.parser = nil;
            });
        }];
    }
    else if ([urlStr isEqualToString:ENTRY_XML_URL])
    {
        // 解析xml
        [weakSelf.parser parserXMLData:data finished:^(id modelObj, NSError *error) {
            // 主线程更新ui
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([modelObj isKindOfClass:[NSArray class]] && error == nil) {
                    weakSelf.entrys = modelObj;
                    [weakSelf.tableView reloadData];
                    
                }
                // 解析完释放解析器
                weakSelf.parser = nil;
            });
        }];
    }
    
}

#pragma mark - Getter
- (ZOPGETDataRequest *)request
{
    if (!_request) {
        _request = [[ZOPGETDataRequest alloc] init];
    }
    return _request;
}
- (ZOPParserData *)parser
{
    if (!_parser) {
        _parser = [[ZOPParserData alloc] init];
    }
    return _parser;
}

- (NSCache *)imageCaches
{
    if (!_imageCaches) {
        _imageCaches = [[NSCache alloc] init];
    }
    return _imageCaches;
}

- (NSMutableArray *)requestings
{
    if (!_requestings) {
        _requestings = [[NSMutableArray alloc] init];
    }
    return _requestings;
}
@end
