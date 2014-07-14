//
//  ViewController.m
//  Touchback
//
//  Created by Michael Stromer on 4/27/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import "ViewController.h"
#import "Sport.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) Sport *sportObject;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tableView = [[UITableView alloc] initWithFrame:(CGRect){{0, 70}, {320, 200}} style: UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSURL *ESPN = [NSURL URLWithString:@"http://api.espn.com/v1/sports/football/nfl/teams/26?apikey=mfexy24m6q6ey69y8atgu84y"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *ESPNConnect = [session dataTaskWithURL:ESPN completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.data    = responseDictionary;
            self.sportObject = [[Sport alloc] initWithDictionary:[responseDictionary[@"sports"] lastObject]];
            [self.tableView reloadData];
        });
        NSLog(@"My Response: %@",responseDictionary);
    }];
    [ESPNConnect resume];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = [self.sportObject.newsURL description];
    return cell;
}
@end
