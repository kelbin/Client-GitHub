//
//  Repo.m
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import "Repo.h"
#import "ServiceController.h"

@implementation Repo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    if (self = [super init]) {
        _name = [dictionary valueForKey:@"name"];
        _descrip = [dictionary valueForKey:@"description"];
        _fork = [dictionary valueForKey:@"forks"];
        _watchers = [dictionary valueForKey:@"watchers"];
        _owner = [Owner new];
        _owner.login = [dictionary valueForKeyPath:@"owner.login"];
        _owner.avatarUrl = [dictionary valueForKeyPath:@"owner.avatar_url"];

    }
    
    return self;
}


@end

