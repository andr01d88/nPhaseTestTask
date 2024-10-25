//
//  Interest.m
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#import <Foundation/Foundation.h>
#import "Interest.h"

@implementation Interest

- (instancetype)initWithInterestName:(NSString *)interestName {
    self = [super init];
    if (self) {
        _interestName = interestName;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"interestName": @"interest_name"
    };
}

@end
