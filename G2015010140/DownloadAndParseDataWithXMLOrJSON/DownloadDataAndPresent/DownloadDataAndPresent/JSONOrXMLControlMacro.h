//
//  JSONOrXMLControlMacro.h
//  DownloadDataAndPresent
//
//  Created by turtle on 15/10/31.
//  Copyright © 2015年 SCNU. All rights reserved.
//

#ifndef JSONOrXMLControlMacro_h
#define JSONOrXMLControlMacro_h

#define JSON

#ifdef JSON
#define LOADING_URL @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json"
#else
#define LOADING_URL @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/xml"
#endif

#endif /* JSONOrXMLControlMacro_h */
