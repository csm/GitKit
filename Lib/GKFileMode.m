//
//  GKFileMode.m
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import "GKFileMode.h"


@implementation GKFileMode

- (id) initWithModeBits:(int32_t)theModeBits objectType:(int32_t)anObjectType
{
    if (self = [super init])
    {
        modeBits = theModeBits;
        objectType = anObjectType;
        octalBytes = [NSString stringWithFormat: @"%o", modeBits];
    }
    return self;
}

@end
