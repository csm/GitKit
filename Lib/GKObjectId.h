//
//  GKObjectId.h
//  GitKit
//
//  Created by Casey Marshall on 5/17/10.
//  Copyright 2010 Modal Domains. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKAnyObjectId.h"

@interface GKObjectId : GKAnyObjectId
{
}

/**
 * Returns an autoreleased null object identifier.
 *
 * \return The null object identifier.
 */
+ (GKObjectId *) zero;

/**
 * Parse a hex string into an autoreleased object identifier.
 *
 * \param hexStr The string.
 * \return The parsed object identifier, or nil if the input string is not
 *  well formed.
 */
+ (GKObjectId *) objectIdFromHexString: (NSString *) hexStr;

/**
 * Returns an autoreleased object identifier initialized with the given data.
 *
 * \param data The data. Must contain at least 20 bytes.
 * \return The object identifier, or nil if an error occurs.
 */
+ (GKObjectId *) objectIdWithData: (NSData *) data;

@end
