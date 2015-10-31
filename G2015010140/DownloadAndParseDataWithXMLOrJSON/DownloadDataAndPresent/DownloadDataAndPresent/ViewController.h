//
//  ViewController.h
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/2.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebRequest.h"
#import "JSONParser.h"
#import "GameIntroTableViewCell.h"
#import "XMLParser.h"
#import "JSONOrXMLControlMacro.h"

@interface ViewController : UIViewController<WebRequestDelegate, XMLParserDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *presentTableView;

@end

