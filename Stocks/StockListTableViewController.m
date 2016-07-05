//
//  StockListTableViewController.m
//  Stocks
//
//  Created by Ryan Cortez on 7/5/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "StockListTableViewController.h"

@interface StockListTableViewController ()

@end

@implementation StockListTableViewController {
    NSArray *_stocks;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self checkForIntialLaunch];
    [self readStocksFromNSUserDefaults];
}

- (void) checkForIntialLaunch {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults boolForKey:@"isFirstLaunch"]) {
        [self setInitalValuesForStocks];
        [userDefaults setBool:YES forKey:@"isFirstLaunch"];
    }
}

- (void) setInitalValuesForStocks {
    NSArray *intialStocks = [NSArray arrayWithObjects:[[Stock alloc]initWithTitle:@"Disney"], [[Stock alloc]initWithTitle:@"Tesla"], [[Stock alloc]initWithTitle:@"Shrek"], [[Stock alloc]initWithTitle:@"Bed, Bath, and Beyond"], nil];
    NSData *stocksAsData = [NSKeyedArchiver archivedDataWithRootObject:intialStocks];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stocksAsData forKey:@"stocksAsData"];
    [userDefaults synchronize];
}

- (void) readStocksFromNSUserDefaults {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *stocksAsData = [userDefaults valueForKey:@"stocksAsData"];
    _stocks = (NSArray *) [NSKeyedUnarchiver unarchiveObjectWithData:stocksAsData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _stocks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StockTableViewCell *cell = (StockTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"StockTableViewCell" forIndexPath:indexPath];
    Stock *stock = _stocks[indexPath.row];
    cell.textLabel.text = stock.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    StockTableViewCell  *cell = (StockTableViewCell *) [tableView cellForRowAtIndexPath:indexPath];
    [self.delegate selectedStockTableViewCell:cell];
}

@end
