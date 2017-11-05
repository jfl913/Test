//
//  NSString+HTML.m
//  Test
//
//  Created by JunfengLi on 2017/11/5.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "NSString+HTML.h"

@implementation NSString (HTML)

- (NSString *)cm_stringByTrimmingHTMLTags {
    NSUInteger index = [self rangeOfString:@"<" options:NSLiteralSearch].location;
    if (index == NSNotFound) {
        return [NSString stringWithString:self];
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSMutableSet *tagSet = [[NSMutableSet alloc] init];
    NSString *tag;
    while (!scanner.isAtEnd) {
        tag = nil;
        
        [scanner scanUpToString:@"<" intoString:NULL];
        [scanner scanUpToString:@">" intoString:&tag];
        
        if (tag) {
            [tagSet addObject:[[NSString alloc] initWithFormat:@"%@>", tag]];
        }
    }
    
    NSMutableString *result = [[NSMutableString alloc] initWithString:self];
    
    for (NSString *t in tagSet) {
        [result replaceOccurrencesOfString:t
                                withString:@" "
                                   options:NSLiteralSearch
                                     range:NSMakeRange(0, result.length)];
    }
    
    return [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
