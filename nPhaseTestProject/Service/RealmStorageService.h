//
//  RealmStorageService.h
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#ifndef RealmStorageService_h
#define RealmStorageService_h

#import <Realm/Realm.h>

@interface RealmStorageService : NSObject

/**
 * Saves a JSON string representing a user to the Realm database.
 *
 * @param userJSON The JSON string representing the user to be saved.
 * @param completion A completion block that is called when the save operation is complete.
 *                   It contains an NSError object if an error occurred, or nil if the operation was successful.
 */
- (void)saveUserJSON:(NSString *_Nullable)userJSON completion:(void (^_Nullable)(NSError * _Nullable error))completion;

/**
 * Fetches all user JSON strings from the Realm database.
 *
 * @param completion A completion block that is called when the fetch operation is complete.
 *                   It contains an array of JSON strings representing the users, or an NSError object if an error occurred.
 */
- (void)fetchAllUserJSONs:(void (^_Nullable)(NSArray<NSString *> * _Nullable userJSONs, NSError * _Nullable error))completion;

@end

#endif /* RealmStorageService_h */
