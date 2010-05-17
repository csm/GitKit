//
//  GKObjectId.m
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import "GKObjectId.h"
#import <stdio.h>

@implementation GKObjectId

+ (GKObjectId *) zero
{
    return [[[GKObjectId alloc] initWithValue1: 0
                                        value2: 0
                                        value3: 0
                                        value4: 0
                                        value5: 0] autorelease];
}

+ (GKObjectId *) objectIdFromHexString: (NSString *) hexStr
{
    if ([hexStr length] < 20)
        return nil;
    
    uint32_t v1, v2, v3, v4, v5;
    if (sscanf([hexStr UTF8String], "%08x%08x%08x%08x%08x", &v1, &v2, &v3, &v4, &v5) != 5)
        return nil;
    
    return [[[GKObjectId alloc] initWithValue1: v1
                                        value2: v2
                                        value3: v3
                                        value4: v4
                                        value5: v5] autorelease];
}

+ (GKObjectId *) objectIdWithData:(NSData *)data
{
    return [[[GKObjectId alloc] initWithData: data] autorelease];
}

@end
