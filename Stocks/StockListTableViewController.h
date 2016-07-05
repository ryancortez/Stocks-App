//
//  StockListTableViewController.h
//  Stocks
//
//  Created by Ryan Cortez on 7/5/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockTableViewCell.h"
#import "Stock.h"

@protocol StockListTableViewControllerDelegate <NSObject>

- (void) selectedStockTableViewCell: (StockTableViewCell *) stockTableViewCell;

@end

@interface StockListTableViewController : UITableViewController

@property id<StockListTableViewControllerDelegate> delegate;

@end
