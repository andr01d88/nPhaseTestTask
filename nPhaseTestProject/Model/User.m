//
//  User.m
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User

- (instancetype)initWithName:(NSString *)name email:(NSString *)email age:(NSInteger)age interests:(NSArray<Interest *> *)interests {
    self = [super init];
    if (self) {
        _name = name;
        _email = email;
        _age = age;
        _interests = interests;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"name": @"name",
        @"email": @"email",
        @"age": @"age",
        @"interests": @"interests"
    };
}

+ (NSValueTransformer *)interestsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:Interest.class];
}

@end
