/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */
 
#import "CloudFormationDescribeStacksResponse.h"


@implementation CloudFormationDescribeStacksResponse

@synthesize nextToken;
@synthesize stacks;

-(id)init
{
    if (self = [super init]) {

		nextToken = nil;
		stacks = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;



    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        [exception release];
        exception = newException;
    }
    else {
        [exception release];
        exception = [theException retain];
    }
}

-(CloudFormationStack *)stacksObjectAtIndex:(int)index;
{
	return (CloudFormationStack *)[stacks objectAtIndex:index];
}

-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
	[buffer appendString:[[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken] autorelease]];
	[buffer appendString:[[[NSString alloc] initWithFormat:@"Stacks: %@,", stacks] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}

-(void)dealloc
{
	[nextToken release];
	[stacks release];
    
    [super dealloc];
}

@end