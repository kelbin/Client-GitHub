//
//  AuthorizationController.h
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

@class ServiceController;
@interface AuthorizationController : UIViewController {
    UITextField *login;
    UITextField *pass;
}

@property(nonatomic,strong) ServiceController* servCon;

-(NSString*)passMethod;
-(NSString*)loginMethod;

@end
