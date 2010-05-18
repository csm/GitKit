//
//  GKTree.m
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import "GKTree.h"


@implementation GKTree

- (GKFileMode *) fileMode
{
    return [[[GKFileMode alloc] initWithModeBits: GKTreeFileMode
                                      objectType: GKTreeObject] autorelease];
}

@end
