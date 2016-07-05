//
//  Stock.h
//  Stocks
//
//  Created by Ryan Cortez on 7/5/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stock : NSObject

@property NSString *title;

- (instancetype) initWithTitle: (NSString *) title;

@end
