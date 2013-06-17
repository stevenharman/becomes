//
//  BecomesTests.m
//  BecomesTests
//
//  Created by Steven Harman on 6/8/13.
//  Copyright (c) 2013 Steven Harman. All rights reserved.
//

#import "BecomesTests.h"
#import "NSObject+Becomes.h"
#import "AnakinSkywalker.h"
#import "Vader.h"

@implementation BecomesTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testBecomingReturnsSelf
{
    AnakinSkywalker *jedi = [[AnakinSkywalker alloc] init];
    
    STAssertEquals(jedi, [jedi becomes:[Vader class]], @"Becoming return the same object");
}

- (void)testAssumesNewClassAfterBecoming
{
    Class vaderClass = [Vader class];
    id jedi = [[[AnakinSkywalker alloc] init] becomes:vaderClass];
    
    STAssertEqualObjects(vaderClass, [jedi class], @"After becoming, an object assumes other object's class");
}

- (void)testNewMessagesAreHandledAfterBecoming
{
    AnakinSkywalker *jedi = [[AnakinSkywalker alloc] init];
    
    STAssertEqualObjects([jedi sideOfTheForce], @"Light Side", @"Before becoming, an object retains original method");
    
    [jedi becomes:[Vader class]];
    
    STAssertEqualObjects([jedi sideOfTheForce], @"Dark Side", @"After becoming, an object uses the other object's method");
}

- (void)testNewMessagesAreAvailableAfterBecoming
{
    id jedi = [[AnakinSkywalker alloc] init];
    
    STAssertThrows([jedi forceChoke], @"Before becoming, an object does not respond to other object's methods");
    
    [jedi becomes:[Vader class]];
    
    STAssertNoThrow([jedi forceChoke], @"After becoming, an object responds to other object's methods");
}

@end
