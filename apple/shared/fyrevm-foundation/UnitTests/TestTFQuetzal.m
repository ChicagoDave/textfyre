//
//  TestTFQuetzal.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TestTFQuetzal.h"

#import "TFQuetzal.h"


static NSString *temporaryFilesDirectory() {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"TestTFQuetzalFiles"];
}

@implementation TestTFQuetzal

- (void)testValidGameSessionFileWithPath:(NSString *)path {

    // (1) Test loading file without error
    
    NSString *errorString = nil;
    TFQuetzalLoadError errorCode = TFQuetzalNoLoadError;
    
    TFQuetzal *gameSessionFile = [TFQuetzal gameSessionWithContentsOfFile:path errorString:&errorString errorCode:&errorCode];
    
    STAssertEquals(errorCode, TFQuetzalNoLoadError, @"Couldn't load Quetzal saved-game session file at path \"%@\": error code %lu, error string: %@", path, (unsigned long)errorCode, errorString);
    
    if (errorCode == TFQuetzalNoLoadError) {
        
        NSString *filename = [path lastPathComponent];
        NSString *newFilePath = [temporaryFilesDirectory() stringByAppendingPathComponent:filename];
        
        NSError *error = nil;
        
        // (2) Test saving file without error
    
        [gameSessionFile writeToFile:newFilePath error:&error];
        STAssertNil(error, @"Couldn't save Quetzal saved-game session file at path \"%@\": %@", path, error);
        
        if (error == nil) {
            NSData *originalFile = [NSData dataWithContentsOfFile:path options:0 error:&error];
            STAssertNil(error, @"Couldn't load Quetzal saved-game session file at path \"%@\" into NSData: %@", path, error);
            if (error == nil) {
                NSData *newFile = [NSData dataWithContentsOfFile:newFilePath options:0 error:&error];
                STAssertNil(error, @"Couldn't load Quetzal saved-game session file at path \"%@\" into NSData: %@", newFilePath, error);
                if (error == nil) {

                    // (3) Do binary comparison of old and new files
    
                    STAssertEquals([originalFile length], [newFile length], @"Original Quetzal saved-game session file at path \"%@\" has length %lu, but new Quetzal saved-game session file at path \"%@\" has different length %lu",
                                    path, (unsigned long)[originalFile length], 
                                    newFilePath, (unsigned long)[newFile length]);
                    if ([originalFile length] == [newFile length]) {
                        for (NSUInteger i = 0; i < [originalFile length]; ++i) {
                            unsigned char originalChar = *((const unsigned char *)[originalFile bytes] + i);
                            unsigned char newChar = *((const unsigned char *)[newFile bytes] + i);
                            
                            STAssertEquals((unsigned int)originalChar, (unsigned int)newChar, @"Difference in content at index %lu, %u vs. %u, in original Quetzal saved-game session file at path \"%@\" vs. new Quetzal saved-game session file at path \"%@\".",
                                            (unsigned long)i,
                                            (int)originalChar, (int)newChar,
                                            path, newFilePath);
                            if (originalChar != newChar) {
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
}
- (void)testInvalidGameSessionFileWithPath:(NSString *)path {
    NSString *filename = [path lastPathComponent];
    
    STAssertTrue([filename hasPrefix:@"Error code "], @"File doesn't start with \"Error code \" at path \"%@\".", path);
    if ([filename hasPrefix:@"Error code "]) {
        NSUInteger i;
        for (i = [@"Error code " length]; i < [filename length]; ++i) {
            if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[filename characterAtIndex:i]] == NO) {
                break;
            }
        }
        NSString *numberString = [filename substringWithRange:NSMakeRange([@"Error code " length], i - [@"Error code " length])];
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        NSNumber *number = [numberFormatter numberFromString:numberString];
        [numberFormatter release];
        STAssertNotNil(number, @"String \"%@\", part of filename %@, isn't a number!", numberString, filename);
        if (number) {
            STAssertTrue([number integerValue] != 0, @"String \"%@\", part of filename %@, is number 0, which means success, which isn't what we're testing for.", numberString, filename);
            if ([number integerValue] != 0) {
                NSString *errorString = nil;
                TFQuetzalLoadError errorCode = TFQuetzalNoLoadError;
                
                TFQuetzal *gameSessionFile = [TFQuetzal gameSessionWithContentsOfFile:path errorString:&errorString errorCode:&errorCode];
                
                STAssertNil(gameSessionFile, @"File should have an error but does not, at path \"%@\".", path);
                if (gameSessionFile == nil) {
                    STAssertEquals((NSInteger)errorCode, [number integerValue], @"File should have error code %ld, but instead has error code %ld, with error string \"%@\", at path \"%@\".", (long)[number integerValue], (long)errorCode, errorString, path);
                }
            }
        }
    }
}

- (void)testGameSessionFiles {

    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *resourcePath = [bundle resourcePath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;

    NSString *validFilesPath = [resourcePath stringByAppendingPathComponent:@"Quetzal Valid Files"];
    NSArray *validFilenames = [fileManager contentsOfDirectoryAtPath:validFilesPath error:&error];
    
    STAssertNil(error, @"Unable to read directory at path \"%@\": %@", validFilesPath, error);

    if (error == nil) {
        NSString *invalidFilesPath = [resourcePath stringByAppendingPathComponent:@"Quetzal Invalid Files"];
        NSArray *invalidFilenames = [fileManager contentsOfDirectoryAtPath:invalidFilesPath error:&error];

        STAssertNil(error, @"Unable to read directory at path \"%@\": %@", invalidFilesPath, error);
        
        if (error == nil) {
            NSString *filesDirectoryPath = temporaryFilesDirectory();
            
            BOOL filesDirectoryIsDirectory = NO;
            BOOL filesDirectoryExists = [fileManager fileExistsAtPath:filesDirectoryPath isDirectory:&filesDirectoryIsDirectory];
            
            if (filesDirectoryExists) {
                [fileManager removeItemAtPath:filesDirectoryPath error:&error];
                STAssertNil(error, @"Unable to delete temporary directory at path \"%@\": %@", filesDirectoryPath, error);
            }
            
            if (error == nil) {
                [fileManager createDirectoryAtPath:filesDirectoryPath withIntermediateDirectories:YES attributes:nil error:&error];
                STAssertNil(error, @"Unable to create temporary directory at path \"%@\": %@", filesDirectoryPath, error);

                if (error == nil) {
                    for (NSString *filename in validFilenames) {
                        if ([filename hasSuffix:@".tfq"]) {
                            NSString *path = [validFilesPath stringByAppendingPathComponent:filename];
                            
                            [self testValidGameSessionFileWithPath:path];
                        }
                    }
                    
                    [self testInvalidGameSessionFileWithPath:[filesDirectoryPath stringByAppendingPathComponent:@"Error code 1, Non-existent file.tfq"]];

                    for (NSString *filename in invalidFilenames) {
                        if ([filename hasSuffix:@".tfq"]) {
                            NSString *path = [invalidFilesPath stringByAppendingPathComponent:filename];
                            
                            [self testInvalidGameSessionFileWithPath:path];
                        }
                    }
                }
            }
        }
    }
}

@end
