//
//  GKTreeEntry.h
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKObjectId.h"
#import "GKFileMode.h"

@class GKTree;

@protocol GKTreeEntryProtocol

- (GKFileMode *) fileMode;
// - (void) accept: (GKTreeVisitor *) visitor flags: (int) flags;

@end


@interface GKTreeEntry : NSObject <GKTreeEntryProtocol>
{
    NSString *name;
    GKTree *parent;
    GKObjectId *objectId;
}

@property (readonly) NSString *name;
@property (readonly) GKTree *parent;
@property (retain) GKObjectId *objectId;

- (id) initWithName: (NSString *) aName
           objectId: (GKObjectId *) anObjectId
             parent: (GKTree *) aParent;

- (NSComparisonResult) compare: (GKTreeEntry *) that;

- (BOOL) isModified;
- (void) setModified;

@end
