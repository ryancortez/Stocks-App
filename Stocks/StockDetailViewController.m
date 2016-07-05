//
//  StockDetailViewController.m
//  Stocks
//
//  Created by Ryan Cortez on 7/5/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "StockDetailViewController.h"

@interface StockDetailViewController ()

@property UILabel *stockNameLabel;
@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;
@property UICollisionBehavior *collision;

@end

@implementation StockDetailViewController


- (void) selectedStockTableViewCell: (StockTableViewCell *) stockTableViewCell {
    CGFloat height = 100;
    
    [_stockNameLabel removeFromSuperview];
    
    _stockNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, stockTableViewCell.frame.size.width, height)];
    _stockNameLabel.text = stockTableViewCell.textLabel.text;
    _stockNameLabel.textColor = [UIColor whiteColor];
    [_stockNameLabel setFont:[UIFont systemFontOfSize:40]];
    _stockNameLabel.textAlignment = NSTextAlignmentCenter;
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[_stockNameLabel]];
    _collision = [[UICollisionBehavior alloc] initWithItems:@[_stockNameLabel]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_collision addBoundaryWithIdentifier:@"barrier" fromPoint:CGPointMake(0, self.view.center.y + (height/2)) toPoint:CGPointMake(self.view.frame.size.width, self.view.center.y + (height/2))];
    
    [self.view addSubview:_stockNameLabel];
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    
    
    
}

@end
