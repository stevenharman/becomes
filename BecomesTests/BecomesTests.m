//
//  BecomesTests.m
//  BecomesTests
//
//  Created by Steven Harman on 6/8/13.
//  Copyright (c) 2013 Steven Harman. All rights reserved.
//

#import "BecomesTests.h"
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
    Class vaderClass = [[[Vader alloc] init] class];
    AnakinSkywalker *jedi = [[AnakinSkywalker alloc] init];
    
    STAssertEquals(jedi, [jedi becomes:vaderClass], @"should return the same object");
}

- (void)testAssumesNewClassAfterBecoming
{
    Class vaderClass = [[[Vader alloc] init] class];
    id jedi = [[[AnakinSkywalker alloc] init] becomes:vaderClass];
    
    STAssertEqualObjects(vaderClass, [jedi class], @"After becoming, object assumes other object's class");
}

- (void)testNewMessagesAreHandledAfterBecoming
{
    Class vaderClass = [[[Vader alloc] init] class];
    AnakinSkywalker *jedi = [[AnakinSkywalker alloc] init];
    
    STAssertEqualObjects([jedi sideOfTheForce], @"Light Side", @"Un-becoming object retains original method");
    
    [jedi becomes:vaderClass];
    
    STAssertEqualObjects([jedi sideOfTheForce], @"Dark Side", @"After becoming, object uses the other object's method");
}

- (void)testNewMessagesAreAvailableAfterBecoming
{
    Class vaderClass = [[[Vader alloc] init] class];
    id jedi = [[AnakinSkywalker alloc] init];
    
    STAssertThrows([jedi forceChoke], @"After becoming, object responds to other object's methods");
    
    [jedi becomes:vaderClass];
    
    STAssertNoThrow([jedi forceChoke], @"After becoming, object responds to other object's methods");
}

@end
