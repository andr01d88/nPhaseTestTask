//
//  UserJSONRealm.h
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

#ifndef UserJSONRealm_h
#define UserJSONRealm_h

#import <Realm/Realm.h>

@interface UserJSONRealm : RLMObject

@property NSString *jsonString;

@end

#endif /* UserJSONRealm_h */

