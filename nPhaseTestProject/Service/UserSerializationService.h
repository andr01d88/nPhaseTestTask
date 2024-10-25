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

/**
 * Serializes a User object into a JSON string.
 *
 * @param user The User object to be serialized.
 * @param completion A block object to be executed when the serialization is complete.
 *                   This block has no return value and takes two arguments:
 *                   the JSON string representation of the user (or nil if an error occurred),
 *                   and an error object describing the problem (or nil if no error occurred).
 */
- (void)serializeUser:(User *_Nullable)user completion:(void (^_Nullable)(NSString * _Nullable jsonString, NSError * _Nullable error))completion;

/**
 * Deserializes a JSON string into a User object.
 *
 * @param jsonString The JSON string to be deserialized.
 * @param completion A block object to be executed when the deserialization is complete.
 *                   This block has no return value and takes two arguments:
 *                   the User object (or nil if an error occurred),
 *                   and an error object describing the problem (or nil if no error occurred).
 */
- (void)deserializeUserFromJSON:(NSString *_Nullable)jsonString completion:(void (^_Nullable)(User * _Nullable user, NSError * _Nullable error))completion;

@end

#endif /* UserSerializationService_h */
