/*******************************************************************************
 * Copyright (C) 2005-2012 Alfresco Software Limited.
 * 
 * This file is part of the Alfresco Mobile SDK.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *  
 *  http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 ******************************************************************************/

#import "AlfrescoListingContext.h"
#import "AlfrescoInternalConstants.h"
#define DEFAULTMAXITEMS 50
#define DEFAULTSKIPCOUNT 0

@interface AlfrescoListingContext ()
@property (nonatomic, strong, readwrite) NSString *sortProperty;
@property (nonatomic, assign, readwrite) BOOL sortAscending;
@property (nonatomic, assign, readwrite) int maxItems;
@property (nonatomic, assign, readwrite) int skipCount;
@property (nonatomic, assign, readwrite) NSUInteger modelClassVersion;
@end

@implementation AlfrescoListingContext


- (id)init
{
    return [self initWithMaxItems:DEFAULTMAXITEMS skipCount:DEFAULTSKIPCOUNT sortProperty:nil sortAscending:YES];
}

- (id)initWithMaxItems:(int)maxItems skipCount:(int)skipCount
{
    return [self initWithMaxItems:maxItems skipCount:skipCount sortProperty:nil sortAscending:YES];
}

- (id)initWithSortProperty:(NSString *)sortProperty sortAscending:(BOOL)sortAscending
{
    return [self initWithMaxItems:DEFAULTMAXITEMS skipCount:DEFAULTSKIPCOUNT sortProperty:sortProperty sortAscending:sortAscending];
}

- (id)initWithMaxItems:(int)maxItems skipCount:(int)skipCount sortProperty:(NSString *)sortProperty sortAscending:(BOOL)sortAscending
{
    self = [super init];
    if (self)
    {
        self.modelClassVersion = kAlfrescoListingContextModelVersion;
        self.sortProperty = sortProperty;
        self.maxItems = DEFAULTMAXITEMS;
        self.skipCount = DEFAULTSKIPCOUNT;
        if (maxItems > 0)
        {
            self.maxItems = maxItems;
        }
        if (skipCount >= 0)
        {
            self.skipCount = skipCount;
        }
        self.sortAscending = sortAscending;
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.sortProperty forKey:@"sortProperty"];
    [aCoder encodeInt:self.maxItems forKey:@"maxItems"];
    [aCoder encodeInt:self.skipCount forKey:@"skipCount"];
    [aCoder encodeBool:self.sortAscending forKey:@"sortAscending"];
    [aCoder encodeInteger:self.modelClassVersion forKey:kAlfrescoModelClassVersion];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (nil != self)
    {
        self.sortAscending = [aDecoder decodeBoolForKey:@"sortAscending"];
        self.sortProperty = [aDecoder decodeObjectForKey:@"sortProperty"];
        self.maxItems = [aDecoder decodeIntForKey:@"maxItems"];
        self.skipCount = [aDecoder decodeIntForKey:@"skipCount"];
        self.modelClassVersion = [aDecoder decodeIntForKey:kAlfrescoModelClassVersion];
    }
    return self;
}


@end
