//
//  TFFeedTableViewController.m
//  TelstraFacts
//
//  Created by Peter Jaber on 4/21/16.
//  Copyright © 2016 Peter Jaber. All rights reserved.
//

#import "TFFeedTableViewController.h"
#import "TFDataModel.h"
#import "TFDataSubElement.h"
#import "TFWebServiceHandler.h"
#import "CustomTableViewCell.h"
#import "AppDelegate.h"
@interface TFFeedTableViewController ()
{
    UIActivityIndicatorView *activityObj;
}
@property(nonatomic,strong)TFDataModel *dataModelObj;
@end
@implementation TFFeedTableViewController
#define  kCellIdentifier @"CustomTableViewCell"
- (void)viewDidLoad {
    [super viewDidLoad];
      //adding Refresh Control and setup target
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor grayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(getDataFromServer)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:kCellIdentifier];

    //creating UIActivityIndicatorView control Object and adding it into self.view
    activityObj=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityObj];
    activityObj.center=self.view.center;
    [activityObj setHidesWhenStopped:YES];
    [activityObj startAnimating];
    //call web service
    [self getDataFromServer];
 }
#pragma  mark getDataFromServer
-(void)getDataFromServer
{
    //get data from server
    [TFWebServiceHandler getFeeds:^(BOOL success, TFDataModel *model){
        //update all changes on main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //checking repsonse
            if(success)
            {
                self.dataModelObj=model;
                self.title=self.dataModelObj.title;
            }
            else
            {
                self.dataModelObj=nil;
                self.title=nil;
            }
            //checking activity indicator if animating then stop
            if([activityObj isAnimating])
            {
                [activityObj stopAnimating];
            }
            //checking refrsh control if refreshing then stop it
            if([self.refreshControl isRefreshing])
            {
                [self.refreshControl endRefreshing];
            }
            //reload all data
            [self.tableView reloadData];
        });
      
    }];
}
#pragma mark didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    NSLog(@"didReceiveMemoryWarning Low memoery warning  ");
    [super didReceiveMemoryWarning];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return [self.dataModelObj.arrRows count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //creating singleton cell object
    static CustomTableViewCell *cell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    });
    //getting data from model as per indexpath
    TFDataSubElement *subElementModel=[self.dataModelObj.arrRows objectAtIndex:indexPath.row];
    [cell setData:subElementModel];
    //calcuating height
    CGFloat height = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    //chekcing height for image
    if (height<50) {
        if(subElementModel.imageHref != nil)  {
            return  51;
        }
        return height+1;
    }
    return height+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //get cell and assign data
    CustomTableViewCell *cellObj = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    [cellObj setData:[self.dataModelObj.arrRows objectAtIndex:indexPath.row]];
    cellObj.selectionStyle=UITableViewCellSelectionStyleNone;
    return cellObj;
}
@end
