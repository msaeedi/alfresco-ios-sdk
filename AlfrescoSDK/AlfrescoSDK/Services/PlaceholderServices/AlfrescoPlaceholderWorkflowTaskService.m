/*
 ******************************************************************************
 * Copyright (C) 2005-2013 Alfresco Software Limited.
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
 *****************************************************************************
 */

/** AlfrescoPlaceholderWorkflowTaskService
 
 Author: Tauseef Mughal (Alfresco)
 */

#import "AlfrescoPlaceholderWorkflowTaskService.h"
#import "AlfrescoCloudSession.h"
#import "AlfrescoCloudWorkflowTask.h"
#import "AlfrescoLegacyAPIWorkflowTask.h"
#import "AlfrescoPublicAPIWorkflowTask.h"

@implementation AlfrescoPlaceholderWorkflowTaskService

- (id)initWithSession:(id<AlfrescoSession>)session
{
    if (session.workflowInfo.publicAPI)
    {
        if ([session isKindOfClass:[AlfrescoCloudSession class]])
        {
            return (id)[[AlfrescoCloudWorkflowTask alloc] initWithSession:session];
        }
        return (id)[[AlfrescoPublicAPIWorkflowTask alloc] initWithSession:session];
    }
    else
    {
        return (id)[[AlfrescoLegacyAPIWorkflowTask alloc] initWithSession:session];
    }
    return nil;
}

@end