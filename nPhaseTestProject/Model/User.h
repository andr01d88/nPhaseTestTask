//
//  User.h
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#ifndef User_h
#define User_h

#import <Mantle/Mantle.h>
#import "Interest.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : MTLModel <MTLJSONSerializing>
- (instancetype)initWithName:(NSString *)name email:(NSString *)email age:(NSInteger)age interests:(NSArray<Interest *> *)interests;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSArray<Interest *> *interests;

@end

NS_ASSUME_NONNULL_END

#endif /* User_h */
