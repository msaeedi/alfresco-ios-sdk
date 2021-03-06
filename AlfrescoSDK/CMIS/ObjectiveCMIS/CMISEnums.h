/*
  Licensed to the Apache Software Foundation (ASF) under one
  or more contributor license agreements.  See the NOTICE file
  distributed with this work for additional information
  regarding copyright ownership.  The ASF licenses this file
  to you under the Apache License, Version 2.0 (the
  "License"); you may not use this file except in compliance
  with the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, either express or implied.  See the License for the
  specific language governing permissions and limitations
  under the License.
 */

#import <Foundation/Foundation.h>

// Binding type
typedef NS_ENUM(NSInteger, CMISBindingType)
{
    CMISBindingTypeAtomPub,
    CMISBindingTypeCustom
};

// Base type
typedef NS_ENUM(NSInteger, CMISBaseType)
{
    CMISBaseTypeDocument,
    CMISBaseTypeFolder,
    CMISBaseTypeRelationship,
    CMISBaseTypePolicy
};

typedef NS_ENUM(NSInteger, CMISIncludeRelationship)
{
    CMISIncludeRelationshipNone,
    CMISIncludeRelationshipSource,
    CMISIncludeRelationshipTarget,
    CMISIncludeRelationshipBoth
};

// Property types
typedef NS_ENUM(NSInteger, CMISPropertyType)
{
    CMISPropertyTypeBoolean = 0,
    CMISPropertyTypeId,
    CMISPropertyTypeInteger,
    CMISPropertyTypeDateTime,
    CMISPropertyTypeDecimal,
    CMISPropertyTypeHtml,
    CMISPropertyTypeString,
    CMISPropertyTypeUri
};

// Property cardinality options
typedef NS_ENUM(NSInteger, CMISCardinality)
{
    CMISCardinalitySingle,
    CMISCardinalityMulti
};

// Property updatability options
typedef NS_ENUM(NSInteger, CMISUpdatability)
{
    CMISUpdatabilityReadOnly,
    CMISUpdatabilityReadWrite,
    CMISUpdatabilityWhenCheckedOut,
    CMISUpdatabilityOnCreate
};

// Allowable action type
typedef NS_ENUM(NSInteger, CMISActionType)
{
    CMISActionCanDeleteObject,
    CMISActionCanUpdateProperties,
    CMISActionCanGetProperties,
    CMISActionCanGetObjectRelationships,
    CMISActionCanGetObjectParents,
    CMISActionCanGetFolderParent,
    CMISActionCanGetFolderTree,
    CMISActionCanGetDescendants,
    CMISActionCanMoveObject,
    CMISActionCanDeleteContentStream,
    CMISActionCanCheckOut,
    CMISActionCanCancelCheckOut,
    CMISActionCanCheckIn,
    CMISActionCanSetContentStream,
    CMISActionCanGetAllVersions,
    CMISActionCanAddObjectToFolder,
    CMISActionCanRemoveObjectFromFolder,
    CMISActionCanGetContentStream,
    CMISActionCanApplyPolicy,
    CMISActionCanGetAppliedPolicies,
    CMISActionCanRemovePolicy,
    CMISActionCanGetChildren,
    CMISActionCanCreateDocument,
    CMISActionCanCreateFolder,
    CMISActionCanCreateRelationship,
    CMISActionCanDeleteTree,
    CMISActionCanGetRenditions,
    CMISActionCanGetACL,
    CMISActionCanApplyACL
};

// AllowableAction String Array, the objects defined MUST be in the same order as those in enum CMISActionType
#define CMISAllowableActionsArray @"canDeleteObject", @"canUpdateProperties", @"canGetProperties", \
    @"canGetObjectRelationships", @"canGetObjectParents", @"canGetFolderParent", @"canGetFolderTree", \
    @"canGetDescendants", @"canMoveObject", @"canDeleteContentStream", @"canCheckOut", \
    @"canCancelCheckOut",  @"canCheckIn", @"canSetContentStream", @"canGetAllVersions", \
    @"canAddObjectToFolder", @"canRemoveObjectFromFolder", @"canGetContentStream", @"canApplyPolicy", \
    @"canGetAppliedPolicies", @"canRemovePolicy", @"canGetChildren", @"canCreateDocument", @"canCreateFolder", \
    @"canCreateRelationship", @"canDeleteTree", @"canGetRenditions", @"canGetACL", @"canApplyACL", nil

// Extension Levels
typedef NS_ENUM(NSInteger, CMISExtensionLevel)
{
    CMISExtensionLevelObject,
    CMISExtensionLevelProperties,
    CMISExtensionLevelAllowableActions,
    CMISExtensionLevelAcl
    // TODO expose the remaining extensions as they are implemented
    // CMISExtensionLevelPolicies, CMISExtensionLevelChangeEvent

};

// UnfileObject
typedef NS_ENUM(NSInteger, CMISUnfileObject)
{
    CMISUnfile,
    CMISDeleteSingleFiled,
    CMISDelete,  // default
};

// ContentStreamAllowed
typedef NS_ENUM(NSInteger, CMISContentStreamAllowedType)
{
    CMISContentStreamNotAllowed,
    CMISContentStreamAllowed,
    CMISContentStreamRequired
};

@interface CMISEnums : NSObject 

+ (NSString *)stringForIncludeRelationShip:(CMISIncludeRelationship)includeRelationship;
+ (NSString *)stringForUnfileObject:(CMISUnfileObject)unfileObject;

@end