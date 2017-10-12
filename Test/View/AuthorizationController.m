//
//  AuthorizationController.m
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import "AuthorizationController.h"
#import <AFNetworking/AFNetworking.h>
#import "ListOfRepositoriesController.h"
#import "ServiceController.h"

@interface AuthorizationController () <UITextFieldDelegate> {
}
@end


@implementation AuthorizationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loginup];
    [self topline];
    [self bottomLine];
    [self login];
    [self password];
    [self labelforlogin];
    [self labelforpass];
    [self gitHubImage];
    [self loadState];
    _servCon = [[ServiceController alloc] init];
    _servCon.authcont = self;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(saveState)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    /*if ([[NSUserDefaults standardUserDefaults] valueForKey:@"login"] && [[NSUserDefaults standardUserDefaults] valueForKey:@"password"]) {
        [self requestAuthorization];
    } else {
        NSLog(@"Зарегистрируйся");
    }*/
    // Do any additional setup after loading the view.
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)gitHubImage {
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, self.view.frame.size.width - 10, self.view.frame.size.height / 2 - 120)];
    back.image = [UIImage imageNamed:@"githublogo"];
    [self.view addSubview:back];
}

- (void)topline {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 65, 350, self.view.frame.size.width / 1.5, 2)];
    lineView.backgroundColor = [UIColor blackColor];
    lineView.layer.cornerRadius = 3;
    [self.view addSubview:lineView];
}

- (void)bottomLine {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 65, 430, self.view.frame.size.width / 1.5, 2)];
    lineView.backgroundColor = [UIColor blackColor];
    lineView.layer.cornerRadius = 3;
    [self.view addSubview:lineView];
}

- (void)loginup {
    UIButton *logUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [logUp setTitle:@"Войти"  forState:UIControlStateNormal];
    [logUp setTitleColor:[UIColor colorWithRed:250 green:250 blue:250 alpha:.77] forState:UIControlStateNormal];
    logUp.frame = CGRectMake(self.view.frame.origin.x + 90, 460.0, self.view.frame.size.width / 2, 40.0);
    logUp.layer.cornerRadius = 10;
    [logUp addTarget:_servCon action:@selector(requestAuthorization)
    forControlEvents:UIControlEventTouchUpInside];
    logUp.backgroundColor = [UIColor blackColor];
    [self.view addSubview:logUp];
}

- (UITextField*)login {
    login = [UITextField new];
    login.delegate = self;
    login.frame = CGRectMake(self.view.frame.origin.x + 65, 330, 200, 20);
    login.textColor = [UIColor blackColor];
    login.tintColor = [UIColor blackColor];
    [self.view addSubview:login];
    return login;
}

- (UITextField*)password {
    pass = [UITextField new];
    pass.delegate = self;
    pass.frame = CGRectMake(self.view.frame.origin.x + 65, 410, 200, 20);
    pass.textColor = [UIColor blackColor];
    pass.tintColor = [UIColor blackColor];
    pass.secureTextEntry = YES;
    [self.view addSubview:pass];
    return pass;
}

- (void)saveState {
    [[NSUserDefaults standardUserDefaults] setValue:login.text forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] setValue:pass.text forKey:@"password"];
}

- (void)loadState {
    login.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"login"];
    pass.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"password"];
}

-(NSString*)passMethod {
    NSString *obj = [NSString new];
    obj = pass.text;
    return obj;
}

-(NSString*)loginMethod {
    NSString *obj = [NSString new];
    obj = login.text;
    return obj;
}

- (void)requestAuthorization {
    [_servCon requestAuthorization:^(BOOL internalBlock) {
        if (internalBlock == YES) {
            ListOfRepositoriesController *list = [[ListOfRepositoriesController alloc] init];
            list.servCon = _servCon;
            [self.navigationController pushViewController:list animated:YES];
            [self saveState];
        } else {
        if (_servCon.httpResponse.statusCode == 401) {
            UIAlertController * alert = [UIAlertController
                                             alertControllerWithTitle:@"Ошибка 401"
                                             message:@"Неверные данные"
                                             preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* closeButton = [UIAlertAction
                                              actionWithTitle:@"Закрыть"
                                              style:UIAlertActionStyleCancel
                                              handler:^(UIAlertAction * action) {}];
            [alert addAction:closeButton];
            [self presentViewController:alert animated:YES completion:nil];
            }
        if (_servCon.httpResponse.statusCode == 404) {
            UIAlertController * alert = [UIAlertController
                                             alertControllerWithTitle:@"Ошибка 404"
                                             message:@"Сервер не отвечает"
                                             preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* closeButton = [UIAlertAction
                                              actionWithTitle:@"Закрыть"
                                              style:UIAlertActionStyleCancel
                                              handler:^(UIAlertAction * action) {}];
            [alert addAction:closeButton];
            [self presentViewController:alert animated:YES completion:nil];
            }
        }
    }];
}

- (void)labelforlogin {
    UILabel *loglabel = [UILabel new];
    loglabel.text = @"Логин";
    loglabel.frame = CGRectMake(self.view.frame.origin.x + 65, 260, 100, 100);
    loglabel.textColor = [UIColor blackColor];
    [self.view addSubview:loglabel];
}

- (void)labelforpass {
    UILabel *logpass = [UILabel new];
    logpass.text = @"Пароль";
    logpass.frame = CGRectMake(self.view.frame.origin.x + 65, 340, 100, 100);
    logpass.textColor = [UIColor blackColor];
    [self.view addSubview:logpass];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
