//
//  TestTFUlxImage.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFUlxImage.h"

#import "TFUlxImage.h"

typedef struct {
    NSString *name;
    uint32_t expectedRAMStart;
} GameInfo;

static const GameInfo kGameInfos[] = {
    // Game currently used by ShadowStd solution via ShadowRelease
    { @"sh-v1.2e.ulx", 
      1730560 },
    { @"sh-v1.0de.ulx", 
      1728512 },
    { @"sh-v1.0e.ulx",
      1728512 }
};
static const size_t kGameInfoCount = sizeof(kGameInfos) / sizeof(GameInfo);

@implementation TestTFUlxImage

- (void)testGameImageWithInfo:(GameInfo)gameInfo {
    TFUlxImage *gameImage = [[TFUlxImage alloc] init];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    NSString *resourcePath = [bundle resourcePath];
    
    NSString *gamePath = [resourcePath stringByAppendingPathComponent:gameInfo.name];
    
    BOOL loadedGame = [gameImage loadFromPath:gamePath];
    
    STAssertTrue(loadedGame, @"Unable to load game at path \"%@\". See console for details.", gamePath);
    
    STAssertEquals(gameImage.RAMStart, gameInfo.expectedRAMStart, @"In game with name \"%@\", RAMStart value was expected to be %lu, but instead is %lu", gameInfo.name, (unsigned long)gameInfo.expectedRAMStart, gameImage.RAMStart);
    
    [gameImage release];
}

- (void)testDecryption {
    
    size_t i;
    
    for (i = 0; i < kGameInfoCount; ++i) {
        [self testGameImageWithInfo:kGameInfos[i]];
    }
}

@end
