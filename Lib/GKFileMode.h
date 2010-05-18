//
//  GKFileMode.h
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GKFileMode : NSObject
{
    NSString *octalBytes;
    int32_t modeBits;
    int32_t objectType;
}

- (id) initWithModeBits: (int32_t) theModeBits
             objectType: (int32_t) anObjectType;

@end
