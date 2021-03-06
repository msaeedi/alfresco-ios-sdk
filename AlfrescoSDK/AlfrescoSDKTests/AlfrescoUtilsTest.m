/*******************************************************************************
 * Copyright (C) 2005-2014 Alfresco Software Limited.
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

#import "AlfrescoUtilsTest.h"
#import "AlfrescoConstants.h"
#import "AlfrescoListingContext.h"
#import "AlfrescoActivityStreamService.h"
#import "AlfrescoCommentService.h"
#import "AlfrescoDocumentFolderService.h"
#import "AlfrescoPersonService.h"
#import "AlfrescoRatingService.h"
#import "AlfrescoSearchService.h"
#import "AlfrescoSiteService.h"
#import "AlfrescoTaggingService.h"
#import "AlfrescoVersionService.h"
#import "AlfrescoWorkflowService.h"

@implementation AlfrescoUtilsTest

- (void)testListingContext
{
    // test defaults are as expected
    AlfrescoListingContext *listingContext = [AlfrescoListingContext new];
    XCTAssertTrue(listingContext.maxItems == 50, @"Expected maxItems to default to 50");
    XCTAssertTrue(listingContext.skipCount == 0, @"Expected skipCount to default to 0");
    XCTAssertTrue(listingContext.sortAscending, @"Expected sortAscending to default to YES");
    XCTAssertNil(listingContext.sortProperty, @"Expected sortProperty to default to nil");
    XCTAssertNotNil(listingContext.listingFilter, @"Expected to find a default listingFilter");
    XCTAssertTrue(listingContext.listingFilter.filters.count == 0,
                  "Expected the default listingFilter to be empty but it had %lu filters", (unsigned long)listingContext.listingFilter.filters.count);
    
    // test various initialisers work correctly
    listingContext = [[AlfrescoListingContext alloc] initWithMaxItems:20];
    XCTAssertTrue(listingContext.maxItems == 20, @"Expected maxItems to be 20 but it was %d", listingContext.maxItems);
    XCTAssertTrue(listingContext.skipCount == 0, @"Expected skipCount to default to 0");
    
    listingContext = [[AlfrescoListingContext alloc] initWithMaxItems:25 skipCount:100];
    XCTAssertTrue(listingContext.maxItems == 25, @"Expected maxItems to be 25 but it was %d", listingContext.maxItems);
    XCTAssertTrue(listingContext.skipCount == 100, @"Expected skipCount to be 100 but it was %d", listingContext.skipCount);
    
    listingContext = [[AlfrescoListingContext alloc] initWithSortProperty:kAlfrescoSortByTitle sortAscending:NO];
    XCTAssertTrue(listingContext.maxItems == 50, @"Expected maxItems to default to 50");
    XCTAssertTrue(listingContext.skipCount == 0, @"Expected skipCount to default to 0");
    XCTAssertTrue([listingContext.sortProperty isEqualToString:kAlfrescoSortByTitle],
                  @"Expected sortProperty to be %@ but it was %@", kAlfrescoSortByTitle, listingContext.sortProperty);
    XCTAssertFalse(listingContext.sortAscending, @"Expected sortAscending to be NO");
    
    AlfrescoListingFilter *listingFilter = [[AlfrescoListingFilter alloc] initWithFilter:kAlfrescoFilterByWorkflowState value:kAlfrescoFilterValueWorkflowStateActive];
    listingContext = [[AlfrescoListingContext alloc] initWithListingFilter:listingFilter];
    XCTAssertTrue(listingContext.maxItems == 50, @"Expected maxItems to default to 50");
    XCTAssertTrue(listingContext.skipCount == 0, @"Expected skipCount to default to 0");
    XCTAssertEqual(listingFilter, listingContext.listingFilter, @"Expected the given listing filter to be the one returned from the listing context");
    XCTAssertTrue(listingContext.listingFilter.filters.count == 1,
                  "Expected listingFilter to have 1 filter but it had %lu", (unsigned long)listingContext.listingFilter.filters.count);
    XCTAssertTrue([listingContext.listingFilter hasFilter:kAlfrescoFilterByWorkflowState], @"Expected the listing filter to have the kAlfrescoFilterByWorkflowState filter");
    XCTAssertTrue([[listingContext.listingFilter valueForFilter:kAlfrescoFilterByWorkflowState] isEqualToString:kAlfrescoFilterValueWorkflowStateActive],
                  @"Expected the listing filter value to be kAlfrescoFilterValueWorkflowStateActive but it was %@", [listingContext.listingFilter valueForFilter:kAlfrescoFilterByWorkflowState]);
    
    // test the properties are readwrite
    listingContext = [AlfrescoListingContext new];
    listingContext.maxItems = 100;
    listingContext.skipCount = 100;
    listingContext.sortAscending = NO;
    listingContext.sortProperty = kAlfrescoSortByDescription;
    listingContext.listingFilter = listingFilter;
}

- (void)testServiceCreationWithNilSession
{
    AlfrescoActivityStreamService *streamService = [[AlfrescoActivityStreamService alloc] initWithSession:nil];
    XCTAssertNil(streamService, @"Expected streamService to be nil as it was created with a nil session");
    
    AlfrescoCommentService *commentService = [[AlfrescoCommentService alloc] initWithSession:nil];
    XCTAssertNil(commentService, @"Expected commentService to be nil as it was created with a nil session");
    
    AlfrescoDocumentFolderService *docFolderService = [[AlfrescoDocumentFolderService alloc] initWithSession:nil];
    XCTAssertNil(docFolderService, @"Expected docFolderService to be nil as it was created with a nil session");
    
    AlfrescoPersonService *personService = [[AlfrescoPersonService alloc] initWithSession:nil];
    XCTAssertNil(personService, @"Expected personService to be nil as it was created with a nil session");
    
    AlfrescoRatingService *ratingService = [[AlfrescoRatingService alloc] initWithSession:nil];
    XCTAssertNil(ratingService, @"Expected ratingService to be nil as it was created with a nil session");
    
    AlfrescoSearchService *searchService = [[AlfrescoSearchService alloc] initWithSession:nil];
    XCTAssertNil(searchService, @"Expected searchService to be nil as it was created with a nil session");
    
    AlfrescoSiteService *siteService = [[AlfrescoSiteService alloc] initWithSession:nil];
    XCTAssertNil(siteService, @"Expected siteService to be nil as it was created with a nil session");
    
    AlfrescoTaggingService *taggingService = [[AlfrescoTaggingService alloc] initWithSession:nil];
    XCTAssertNil(taggingService, @"Expected taggingService to be nil as it was created with a nil session");
    
    AlfrescoVersionService *versionService = [[AlfrescoVersionService alloc] initWithSession:nil];
    XCTAssertNil(versionService, @"Expected versionService to be nil as it was created with a nil session");
    
    AlfrescoWorkflowService *workflowService = [[AlfrescoWorkflowService alloc] initWithSession:nil];
    XCTAssertNil(workflowService, @"Expected workflowService to be nil as it was created with a nil session");
}

@end
