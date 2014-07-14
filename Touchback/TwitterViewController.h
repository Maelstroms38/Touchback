//
//  TwitterViewController.h
//  Touchback
//
//  Created by Michael Stromer on 4/27/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface TwitterViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *dataSource;
@end
