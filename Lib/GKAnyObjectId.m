//
//  GKAnyObjectId.m
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import "GKAnyObjectId.h"


@implementation GKAnyObjectId

- (id) initWithData: (NSData *) data
{
    if (self = [super init])
    {
        if ([data length] < 20)
        {
            return nil;
        }
        [data getBytes: &val1 range: NSMakeRange( 0, 4)];
        [data getBytes: &val2 range: NSMakeRange( 4, 4)];
        [data getBytes: &val3 range: NSMakeRange( 8, 4)];
        [data getBytes: &val4 range: NSMakeRange(12, 4)];
        [data getBytes: &val5 range: NSMakeRange(16, 4)];
        val1 = ntohl(val1);
        val2 = ntohl(val2);
        val3 = ntohl(val3);
        val4 = ntohl(val4);
        val5 = ntohl(val5);
    }
    return self;
}

- (id) initWithValue1: (uint32_t) v1
               value2: (uint32_t) v2
               value3: (uint32_t) v3
               value4: (uint32_t) v4
               value5: (uint32_t) v5
{
    if (self = [super init])
    {
        val1 = v1;
        val2 = v2;
        val3 = v3;
        val4 = v4;
        val5 = v5;
    }
    return self;
}

- (uint32_t) value1 { return val1; }
- (uint32_t) value2 { return val2; }
- (uint32_t) value3 { return val3; }
- (uint32_t) value4 { return val4; }
- (uint32_t) value5 { return val5; }

- (BOOL) isEqual:(GKAnyObjectId *) object
{
    return (val1 == [object value1]
            && val2 == [object value2]
            && val3 == [object value3]
            && val4 == [object value4]
            && val5 == [object value5]);
}

- (NSComparisonResult) compare: (GKAnyObjectId *) other
{
    if (self == other)
        return NSOrderedSame;
    
    if (val1 < [other value1])
        return NSOrderedAscending;
    if (val1 > [other value1])
        return NSOrderedDescending;

    if (val2 < [other value2])
        return NSOrderedAscending;
    if (val2 > [other value2])
        return NSOrderedDescending;

    if (val3 < [other value3])
        return NSOrderedAscending;
    if (val3 > [other value3])
        return NSOrderedDescending;

    if (val4 < [other value4])
        return NSOrderedAscending;
    if (val4 > [other value4])
        return NSOrderedDescending;

    if (val5 < [other value5])
        return NSOrderedAscending;
    if (val5 > [other value5])
        return NSOrderedDescending;
    
    return NSOrderedSame;
}

- (NSData *) data
{
    NSMutableData *d = [NSMutableData dataWithCapacity: 20];
    uint32_t t;
    t = htonl(val1);
    [d appendBytes: (const void *) &t length: 4];
    t = htonl(val2);
    [d appendBytes: (const void *) &t length: 4];
    t = htonl(val3);
    [d appendBytes: (const void *) &t length: 4];
    t = htonl(val4);
    [d appendBytes: (const void *) &t length: 4];
    t = htonl(val5);
    [d appendBytes: (const void *) &t length: 4];
    return [NSData dataWithData: d];
}

- (NSString *) hexString
{
    return [NSString stringWithFormat: @"%08x%08x%08x%08x%08x", val1, val2,
            val3, val4, val5];
}

@end
