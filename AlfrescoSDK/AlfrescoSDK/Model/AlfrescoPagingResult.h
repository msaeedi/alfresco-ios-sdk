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

#import <Foundation/Foundation.h>

/** The AlfrescoPagingResult is used to return a paged result of a query against the repository.
 
 Author: Gavin Cornwell (Alfresco), Tijs Rademakers (Alfresco)
 */

@interface AlfrescoPagingResult : NSObject


/// Returns a list of all objects present in the page.
@property (nonatomic, strong, readonly) NSArray *objects;


/// Returns true if there are more items available.
@property (nonatomic, assign, readonly) BOOL hasMoreItems;


/// Returns the total number of items that could potentially be returned, -1 means the total number of items was undetermined.
@property (nonatomic, assign, readonly) int totalItems;

/**---------------------------------------------------------------------------------------
 * @name initialiser.
 *  ---------------------------------------------------------------------------------------
 */

/**
 creates an instance of AlfrescoPaging
 @param objects the items for this page
 @param hasMoreItems flag indicating if more items are available.
 @param totalItems the total number of items available.
 */
- (id)initWithArray:(NSArray *)objects hasMoreItems:(BOOL)hasMoreItems totalItems:(int)totalItems;

@end
