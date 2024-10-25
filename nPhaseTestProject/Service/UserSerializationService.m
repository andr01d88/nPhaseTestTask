//
//  UserSerializationService.m
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#import "UserSerializationService.h"
#import <Mantle/Mantle.h>

@implementation UserSerializationService

- (void)serializeUser:(User *)user completion:(void (^)(NSString * _Nullable jsonString, NSError * _Nullable error))completion {
    NSError *error = nil;
    NSDictionary *userDict = [MTLJSONAdapter JSONDictionaryFromModel:user error:&error];
    if (error) {
        if (completion) {
            completion(nil, error);
        }
        return;
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        if (completion) {
            completion(nil, error);
        }
        return;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (completion) {
        completion(jsonString, nil);
    }
}

- (void)deserializeUserFromJSON:(NSString *)jsonString completion:(void (^)(User * _Nullable user, NSError * _Nullable error))completion {
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        if (completion) {
            completion(nil, error);
        }
        return;
    }
    
    User *user = [MTLJSONAdapter modelOfClass:User.class fromJSONDictionary:jsonDict error:&error];
    if (completion) {
        completion(user, error);
    }
}

@end
