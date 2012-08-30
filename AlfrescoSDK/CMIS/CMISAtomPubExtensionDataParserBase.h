/*
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "CMISAtomPubExtensionElementParser.h"
#import "CMISExtensionData.h"

@interface CMISAtomPubExtensionDataParserBase : NSObject <CMISAtomPubExtensionElementParserDelegate>

@property (nonatomic, weak) id<NSXMLParserDelegate> childParserDelegate;
@property (nonatomic, strong) NSMutableArray *currentExtensions;
@property (nonatomic, strong) CMISExtensionData *currentExtensionData;
@property (nonatomic, strong) NSMutableArray *previousExtensionDataArray;

- (id)init;

// Saves the current extensionData and extensions state and sets the messaged object as the new current extensionData object
- (void)pushNewCurrentExtensionData:(CMISExtensionData *)extensionDataObject;
//  Saves the current extensions on the extensionData object and makes the previous extensionData and extensions the current objects
- (void)saveCurrentExtensionsAndPushPreviousExtensionData;

@end
