//
//  Stock.m
//  Stocks
//
//  Created by Ryan Cortez on 7/5/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "Stock.h"

@implementation Stock

- (instancetype) initWithTitle: (NSString *) title {
    self = [super init];
    self.title = title;
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.title = [coder decodeObjectForKey:@"title"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
}

@end
