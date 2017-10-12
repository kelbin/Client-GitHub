//
//  Commits.m
//  Test
//
//  Created by Kelbin on 11.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import "Commits.h"

@implementation Commits

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        _detail = [DetailCommits new];
        [_detail initClass];
        _sh = [dictionary valueForKey:@"sha"];
        _detail.message = [dictionary valueForKeyPath:@"commit.message"];
        _detail.authored.name = [dictionary valueForKeyPath:@"commit.author.name"];
        _detail.authored.date = [dictionary valueForKeyPath:@"commit.author.date"];
    }
    return self;
}

@end
