//
//  RealmStorageService.m
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#import <Foundation/Foundation.h>
#import "RealmStorageService.h"
#import "UserJSONRealm.h"

@implementation RealmStorageService

- (void)saveUserJSON:(NSString *)userJSON completion:(void (^)(NSError * _Nullable error))completion {
    // We use background queue here in case it could be a long task, probably not for that test case, but in general it is possible
    // The same for autorelease pool, in case we save heavy objects we may need to free memory proactivly
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            NSError *error = nil;
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                UserJSONRealm *userJSONRealm = [[UserJSONRealm alloc] init];
                userJSONRealm.jsonString = userJSON;
                [realm addObject:userJSONRealm];
            } error:&error];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(error);
                });
            }
        }
    });
}

- (void)fetchAllUserJSONs:(void (^)(NSArray<NSString *> * _Nullable userJSONs, NSError * _Nullable error))completion {
    // We use background queue here in case it could be a long task, probably not for that test case, but in general it is possible
    // The same for autorelease pool, in case we fetch heavy objects we may need to free memory proactivly
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            NSError *error = nil;
            RLMRealm *realm = [RLMRealm defaultRealm];
            RLMResults<UserJSONRealm *> *results = [UserJSONRealm allObjectsInRealm:realm];
            NSMutableArray<NSString *> *userJSONs = [NSMutableArray array];
            
            for (UserJSONRealm *userJSONRealm in results) {
                [userJSONs addObject:userJSONRealm.jsonString];
            }
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(userJSONs, error);
                });
            }
        }
    });
}

@end

