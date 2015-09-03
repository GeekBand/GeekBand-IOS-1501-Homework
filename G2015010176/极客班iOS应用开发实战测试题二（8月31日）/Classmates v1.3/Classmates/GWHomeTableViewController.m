//
//  GWHomeTableViewController.m
//  同学录
//
//  Created by Will Ge on 8/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWHomeTableViewController.h"
#import "GWCustomTableViewCell.h"
#import "GWClassmate.h"
#import <Realm/Realm.h>
#import "GWDetailViewController.h"
#import "GWShowDetailViewController.h"


@interface GWHomeTableViewController ()

@property (nonatomic, strong) RLMResults *resultsArray;

@end

@implementation GWHomeTableViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Query all data from default database
    self.resultsArray = [GWClassmate allObjects];

    
    // Sort classmate with name
    self.resultsArray = [self.resultsArray sortedResultsUsingProperty:@"name" ascending:YES];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    
    NSLog(@"Totol classmates: %ld.", (unsigned long)self.resultsArray.count);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.resultsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GWCustomTableViewCell *cell = (GWCustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Reuse Cell Identifier"];
    
    // Configure the cell...
    
    if (!cell) {
        cell = [[GWCustomTableViewCell alloc] init];
    }
    
    // Set value for cell frome data fetch frome Realm database
    GWClassmate *classmate = self.resultsArray[indexPath.row];
    
    // Use thumbnail image  (from BNR p379)
    UIImage * image = [UIImage imageWithData:classmate.avatar];
    [self setThumbnailFromImage:image];
    cell.avatar.image  = image;
    cell.name.text     = classmate.name;
    cell.info.text     = classmate.info;
    cell.uuid.text     = classmate.uuid;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        
        GWCustomTableViewCell *cell = (GWCustomTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        
        // Query the classmate with UUID
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"uuid = %@", cell.uuid.text];
        RLMResults *results = [GWClassmate objectsWithPredicate:pred];

        GWClassmate *classmate = results[0];

        // Get the default database
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        // Delete object from database
        [realm beginWriteTransaction];
        [realm deleteObject:classmate];
        [realm commitWriteTransaction];
        
        
        [self.tableView reloadData];

    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    

    GWCustomTableViewCell *cell = (GWCustomTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"Classmat's UUID: %@", cell.uuid.text);
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
    
}



#pragma mark - Navigation

//  Seuge show detail view and send  table view cell's UUID
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        GWCustomTableViewCell *cell = (GWCustomTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        
        GWShowDetailViewController *vc = (GWShowDetailViewController *)segue.destinationViewController;
        
        vc.uuid  = cell.uuid.text;


    }
}



#pragma mark - Set Thumbnail From Image

- (UIImage *)setThumbnailFromImage:(UIImage *)image
{
    CGSize origImageSize = image.size;
    
    // The rectangle of the thumbnail
    CGRect newRect = CGRectMake(0, 0, 80, 80);
    
    // Figure out a scaling ratio to make sure we maintain the same aspect ratio
    float ratio = MAX(newRect.size.width / origImageSize.width,
                      newRect.size.height / origImageSize.height);
    
    // Create a transparent bitmap context with a scaling factor
    // equal to that of the screen
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    
    // Create a path that is a rounded rectangle
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect
                                                    cornerRadius:5.0];
    
    // Make all subsequent drawing clip to this rounded rectangle
    [path addClip];
    
    // Center the image in the thumbnail rectangle
    CGRect projectRect;
    projectRect.size.width  = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x    = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y    = (newRect.size.height - projectRect.size.height) / 2.0;
    
    // Draw the image on it
    [image drawInRect:projectRect];
    
    // Get the image from the image context; keep it as our thumbnail
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    image = smallImage;
    
    // Cleanup image context resources; we're done
    UIGraphicsEndImageContext();
    
    return image;
}


@end
