//
//  Interest.h
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#ifndef Interest_h
#define Interest_h
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface Interest : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *interestName;

- (instancetype)initWithInterestName:(NSString *)interestName;

@end

NS_ASSUME_NONNULL_END

#endif /* Interest_h */
