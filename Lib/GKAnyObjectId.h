//
//  GKAnyObjectId.h
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdint.h>

@interface GKAnyObjectId : NSObject <NSCopying>
{
    uint32_t val1, val2, val3, val4, val5;
}

- (id) initWithData: (NSData *) data;
- (id) initWithValue1: (uint32_t) v1
               value2: (uint32_t) v2
               value3: (uint32_t) v3
               value4: (uint32_t) v4
               value5: (uint32_t) v5;

- (uint32_t) value1;
- (uint32_t) value2;
- (uint32_t) value3;
- (uint32_t) value4;
- (uint32_t) value5;

- (BOOL) isEqual:(GKAnyObjectId *) object;
- (NSComparisonResult) compare: (GKAnyObjectId *) other;

- (NSData *) data;
- (NSString *) hexString;

@end
