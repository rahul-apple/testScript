//
//  ViewController.m
//  testScript
//
//  Created by RAHUL'S MAC MINI on 31/08/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "ViewController.h"
#import "ChatEncoder.h"
#define ENCODE_SECRET @"nagainfo"
@interface ViewController (){
    NSString *messageString;
    ChatEncoder *chatEncoder;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    messageString = @"THIS IS A TEST MESSAGE";
    chatEncoder = [[ChatEncoder alloc]initWithSecret:ENCODE_SECRET];
    [_txtView setText:[NSString stringWithFormat:@"Encrypting....%@",messageString]];
    [chatEncoder EncryptMessage:messageString onCompletion:^(NSString *encryptedMessage, NSString *IV) {
        [_txtView setText:[NSString stringWithFormat:@"%@\nIV Genarated:%@",_txtView.text,IV]];
        [_txtView setText:[NSString stringWithFormat:@"%@\nencrypted Message:%@",_txtView.text,encryptedMessage]];
        [chatEncoder DecryptMessage:encryptedMessage andIV:IV onCompletion:^(NSString *message) {
            [_txtView setText:[NSString stringWithFormat:@"%@\n\nDecryptedMessage:%@",_txtView.text,message]];
        }];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
