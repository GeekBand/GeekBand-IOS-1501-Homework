//
//  GWHomeTableViewController.m
//  BLTest2
//
//  Created by Will Ge on 8/23/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWHomeTableViewController.h"
#import "GWAppsTableViewCell.h"
#import "Reachability.h"
#import "GWGlobal.h"


@interface GWHomeTableViewController ()  <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSArray *appEntries;

@end

@implementation GWHomeTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    [self checkNetwork];
//    
//    [self downloadData];
    
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Download data

- (void)downloadData {
    
    // Get the Entry Dictionary contaions 10 objects (apps what we really care).
    NSURL *url = [NSURL URLWithString:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=100/json"];
    
    
    // Use NSURLSession fetch the JSON data
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [configuration setAllowsCellularAccess:[GWGlobal shareGlobal].useCellularFlag];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *download =
    [session downloadTaskWithURL:url
               completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                   
                   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                   
                   if (httpResponse.statusCode == 200) {
                       // Connection succeeded, get the data from JSON
                       NSData *jsonRequests = [NSData dataWithContentsOfURL:location];
                       
                       NSDictionary *appListRequests = [NSJSONSerialization JSONObjectWithData:jsonRequests options:0 error:NULL];
                       
                       self.appEntries = [appListRequests valueForKeyPath:@"feed.entry"];
                       
                   } else {
                       
                       NSLog(@"Connection failed, because HTTP status code is not 200.");
                   }
               }];
    [download resume];
    
    // Get the data directly from URL
    //    NSData *jsonRequests = [NSData dataWithContentsOfURL:url];
    //
    //    NSDictionary *appListRequests = [NSJSONSerialization JSONObjectWithData:jsonRequests options:0 error:NULL];
    //
    //    self.appEntries = [appListRequests valueForKeyPath:@"feed.entry"];
}


#pragma mark - Check network

- (void)checkNetwork {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable) {
        
        // NO network
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Download failed, please check your WIFI is on.)"
                                                       delegate:nil
                                              cancelButtonTitle:@"Get it."
                                              otherButtonTitles:nil];
        [alert show];
        
    } else if (status == ReachableViaWiFi) {
        
        //WiFi
        
    } else if (status == ReachableViaWWAN) {
        
        // Cellular
        
        if ([GWGlobal shareGlobal].useCellularFlag) {
            
            
        } else {
            // Connection by Cellular failed alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Download failed, please check your WIFI is on. Or go to Settings > Generial turn on \"Use Cellular\".)"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Get it."
                                                  otherButtonTitles:nil];
            [alert show];

        }
    }
}


#pragma mark - Refresh action

- (IBAction)refreshAppsCell {
 
    [self.refreshControl beginRefreshing];
    
    
    
    dispatch_queue_t fetchQ = dispatch_queue_create("fetch apps' data", NULL);
    
    dispatch_async(fetchQ, ^{
        
        [self checkNetwork];
        [self downloadData];
        [self.tableView reloadData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
        }); 
    });
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 100;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //  Set name category summary and image for appsCell
    GWAppsTableViewCell *cell = (GWAppsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"reuseIdentifierApps"];
    
//    [self configureAppsCell:appsCell forIndexPath:indexPath];
    
    NSDictionary *emtry = self.appEntries[indexPath.row];
    
    // Configure cells' properties
    // FIXIT: - Add third UIImage refresh pod
    NSArray *imimage = [emtry valueForKeyPath:@"im:image"];
    NSDictionary *mediumImage = imimage[1];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[mediumImage valueForKeyPath:@"label"]]]];
    cell.appImage.image = image;
    
    NSDictionary *imName = [emtry valueForKeyPath:@"im:name"];
    NSString *title = [imName valueForKeyPath:@"label"];
    cell.appTitle.text = title;
    
    NSString *category = [emtry valueForKeyPath:@"category.attributes.label"];
    cell.appCategory.text = category;
    
    NSString *summary = [emtry valueForKeyPath:@"summary.label"];
    cell.appSummary.text = summary;
    
    return cell;

    
    
}

/*
#pragma mark - Configuring table view cells about apps


- (void)configureAppsCell:(GWAppsTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    

    NSDictionary *emtry = self.appEntries[indexPath.row];
    
    // Configure cells' properties
    NSArray *imimage = [emtry valueForKeyPath:@"im:image"];
    NSDictionary *mediumImage = imimage[1];
    UIImage *image = [UIImage imageWithData:[mediumImage valueForKeyPath:@"label"]];
    cell.appImage.image = image;
    
    NSDictionary *imName = [emtry valueForKeyPath:@"im:name"];
    NSString *title = [imName valueForKeyPath:@"label"];
    cell.appTitle.text = title;
    
    NSString *category = [emtry valueForKeyPath:@"category.attributes.label"];
    cell.appCategory.text = category;
    
    NSString *summary = [emtry valueForKeyPath:@"summary.label"];
    cell.appSummary.text = summary;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // 获得发送消息的 indexPath
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
}
*/

@end
