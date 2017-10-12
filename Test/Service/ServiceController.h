//
//  ServiceController.h
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//


#import <UIKit/UIKit.h>

@class AuthorizationController;
@class Repo;
@class Commits;
@interface ServiceController : NSObject  {}

@property(nonatomic,retain) NSString *textForLogin;
@property(nonatomic,retain) NSString *textForPass;
@property(nonatomic,strong) AuthorizationController *authcont;
@property(nonatomic,strong) NSHTTPURLResponse *httpResponse;
@property(nonatomic,retain) NSMutableArray<Repo*> *reposArray;
@property(nonatomic,strong) NSString *repositories;
@property(nonatomic,retain) NSMutableArray<Commits*> *commitsArray;


-(void)requestAuthorization:(void (^)(BOOL internalBlock))block;
-(void)requestCommit:(void (^)(NSMutableArray<Commits*> *internalblock))block;

@end
