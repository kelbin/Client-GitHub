//
//  Service.m
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceController.h"
#import <AFNetworking/AFNetworking.h>
#import "AuthorizationController.h"
#import "Repo.h"
#import "Commits.h"
#import "DetailedReposController.h"

@implementation ServiceController

@synthesize authcont;
@synthesize textForPass;
@synthesize textForLogin;

- (void)requestAuthorization:(void (^)(BOOL internalBlock))block {
    textForLogin = [authcont loginMethod];
    textForPass = [authcont passMethod];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:textForLogin password:textForPass];
    
    [manager GET:@"https://api.github.com/user/repos"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask *task, id response) {
             
             NSLog(@"%@", response);
             
             _reposArray = [NSMutableArray new];
             
             if([response isKindOfClass:[NSArray class]]) {
                 for(NSDictionary *repo in response) {
                     
                     [_reposArray addObject:[[Repo alloc] initWithDictionary:repo]];
                     
                 }
             }
             
             if (_reposArray == nil || [_reposArray count] == 0) {
                 NSLog(@"Array is Empty");
             } else {
                 NSLog(@"%@", [_reposArray valueForKey:@"owner"]);
                 for (NSString *jop in [_reposArray valueForKey:@"owner"]) {
                     NSLog(@"%@", [jop valueForKey:@"login"]);
                 }
             }

             block(YES);
         } failure:^(NSURLSessionDataTask *task, NSError *errorRequest) {
             _httpResponse = (NSHTTPURLResponse *)task.response;
             block(NO);
         }];
}

- (void)requestCommit:(void (^)(NSMutableArray<Commits*> *internalblock))block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = [NSString stringWithFormat:@"https://api.github.com/repos/%@/%@/commits", textForLogin, _repositories];
    _commitsArray = [NSMutableArray new];
    [manager GET:url
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             for (NSDictionary *commit in responseObject) {
                 [_commitsArray addObject:[[Commits alloc] initWithDictionary:commit]];
             }
             block(_commitsArray);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"Ne poshlo");
         }];
}


@end

