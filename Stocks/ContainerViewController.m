//
//  ContainerViewController.m
//  Stocks
//
//  Created by Ryan Cortez on 7/5/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "ContainerViewController.h"
#import "StockListTableViewController.h"
#import "StockDetailViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    StockDetailViewController *stockDetailViewController = self.childViewControllers.firstObject;
    StockListTableViewController *stockListTableViewController = self.childViewControllers.lastObject;
    
    stockListTableViewController.delegate = stockDetailViewController;
}



@end
