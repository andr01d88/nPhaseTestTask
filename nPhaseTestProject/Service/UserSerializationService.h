//
//  UserSerializationService.h
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#ifndef UserSerializationService_h
#define UserSerializationService_h

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserSerializationService : NSObject
- (void)serializeUser:(User *_Nullable)user completion:(void (^_Nullable)(NSString * _Nullable jsonString, NSError * _Nullable error))completion;
- (void)deserializeUserFromJSON:(NSString *_Nullable)jsonString completion:(void (^_Nullable)(User * _Nullable user, NSError * _Nullable error))completion;

@end

#endif /* UserSerializationService_h */
