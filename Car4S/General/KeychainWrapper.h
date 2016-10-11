//
//  KeychainWrapper.h
//  Car4S
//  封装keychain
//  Created by Alta on 16/6/1.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Define an Objective-C wrapper class to hold Keychain Services code.
@interface KeychainWrapper : NSObject {
    NSMutableDictionary        *keychainData;
    NSMutableDictionary        *genericPasswordQuery;
}

@property (nonatomic, strong) NSMutableDictionary *keychainData;
@property (nonatomic, strong) NSMutableDictionary *genericPasswordQuery;

- (void)mySetObject:(id)inObject forKey:(id)key;
- (id)myObjectForKey:(id)key;
- (void)resetKeychainItem;

@end


