//
//  TodayViewController.m
//  今日要闻
//
//  Created by zhangliang on 14-10-10.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "JSONKit.h"
#define XLOG(x)  (NSLog(@"%s:%@", __FUNCTION__, x))


@interface TodayViewController () <NCWidgetProviding, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) UITableView       *tableView;
@property (nonatomic, retain) NSMutableArray    *dataSourceArray;
@end

@implementation TodayViewController
- (void)dealloc
{XLOG(@"");
    [_tableView release];
    [_dataSourceArray release];
    [super dealloc];
}

- (void)loadView
{
    XLOG(@"");
    [super loadView];
    
    [self initWithNibName:@"TodayViewController" bundle:nil];
    
    self.dataSourceArray = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    
    XLOG(@"");
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    XLOG(@"");
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    XLOG(@"");
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    XLOG(@"");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    XLOG(@"");
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    
    [self loadNewDataCompletion:^(NCUpdateResult result) {
        
        if (result == NCUpdateResultNewData) {
            [self resetTableView];
        }else if (result == NCUpdateResultFailed) {
            NSLog(@"网络下载出错啦！");
        }else if (result == NCUpdateResultNoData) {
            NSLog(@"没有最新数据！");
        }
        completionHandler(result);
    }];
}


- (void)loadNewDataCompletion:(void (^)(NCUpdateResult result))handler
{
    NSString *urlString = @"http://news.163.com/special/hot_tags_recommend_data/";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               if (error) {
                                   handler(NCUpdateResultFailed);
                                   
                               } else {
                                   NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
                                   NSString *downloadString = [[NSString alloc] initWithData:data encoding:enc];
                                   NSError *localError = nil;
                                   if (downloadString == nil || downloadString.length < 20) {
                                       localError = [[NSError alloc] init];
                                       handler(NCUpdateResultNoData);
                                       
                                       
                                       [localError release];
                                   }else {
                                       NSRange range = NSMakeRange(18, downloadString.length - 18);
                                       NSString *jsonString = [downloadString substringWithRange:range];
                                       NSDictionary *jsonDict = [jsonString objectFromJSONString];
                                       [self deSerializationDownloadData:jsonDict];
                                       handler(NCUpdateResultNewData);
                                   }
                                   
                                   [downloadString release];
                               }
                           }];
    [request release];
    [queue release];
    
}

- (void)deSerializationDownloadData:(NSDictionary *)dict
{
    NSArray *dataArray = dict[@"data"];
    if (dataArray != nil && dataArray.count > 0) {
        self.dataSourceArray = [NSMutableArray array];
        for (NSDictionary *newsDcit in dataArray) {
            [self.dataSourceArray addObject:newsDcit];
            if (self.dataSourceArray.count > 3) {
                break;
            }
        }
    }
}

- (void)resetTableView
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        CGFloat height = [self.tableView.dataSource tableView:self.tableView numberOfRowsInSection:0] * 44 + 10;
        [self setPreferredContentSize:CGSizeMake(self.tableView.contentSize.width, height)];
    });
}

#pragma mark TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.dataSourceArray.count) {
        NSDictionary *newsDict = self.dataSourceArray[indexPath.row];
        NSString *urlString = newsDict[@"url"];
        [self.extensionContext openURL:[NSURL URLWithString:urlString] completionHandler:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [tableView deselectRowAtIndexPath:indexPath animated:NO];
            
        });
    }

    if (indexPath.row == self.dataSourceArray.count) {
        NSURL *myUrl = [NSURL URLWithString:@"HelloTodayWidget://abcde"];
        
        if(myUrl){
            
            [self.extensionContext openURL:myUrl completionHandler:^(BOOL success){
                NSLog(@"成功跳转?  %d", success);
            }];
            
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{XLOG(@"");
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
}

#pragma mark TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row < self.dataSourceArray.count) {
        NSDictionary *newsDict = self.dataSourceArray[indexPath.row];
        cell.textLabel.text = newsDict[@"name"];
    }
    
    if (indexPath.row == self.dataSourceArray.count) {
        cell.textLabel.text = @"containing app";
    }
    return cell;
}


@end
