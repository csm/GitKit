//
//  GKTreeEntry.m
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import "GKTreeEntry.h"
#import "GKTree.h"

@implementation GKTreeEntry

@synthesize name;
@synthesize objectId;
@synthesize parent;

- (id) initWithName: (NSString *) aName
           objectId: (GKObjectId *) anObjectId
             parent: (GKTree *) aParent
{
    if (self = [super init])
    {
        name = [aName retain];
        parent = aParent;
        if (parent != nil)
            [parent retain];
        objectId = anObjectId;
        if (objectId != nil)
            [objectId retain];
    }
    return self;
}

- (NSComparisonResult) compare: (GKTreeEntry *) that
{
    char selfend = [self isKindOfClass: [GKTree class]] ? '/' : '\0';
    char thatend = [that isKindOfClass: [GKTree class]] ? '/' : '\0';
    if (selfend < thatend)
        return NSOrderedAscending;
    else if (selfend > thatend)
        return NSOrderedDescending;
    return [name compare: that.name];
}

- (BOOL) isModified
{
    return objectId == nil;
}

- (void) setModified
{
    if (objectId != nil)
    {
        [objectId release];
        objectId = nil;
    }
}

- (GKFileMode *) fileMode
{
    return nil;
}

- (void) dealloc
{
    if (name != nil)
        [name release];
    if (parent != nil)
        [parent release];
    if (objectId != nil)
        [objectId release];
    [super dealloc];
}

@end
