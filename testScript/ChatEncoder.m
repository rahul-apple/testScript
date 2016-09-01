//
//  ChatEncoder.m
//  testScript
//
//  Created by RAHUL'S MAC MINI on 01/09/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "ChatEncoder.h"
#import "NSData+Base64.h"
#import "NSData+FastHex.h"
@implementation ChatEncoder

- (instancetype)initWithSecret:(NSString *)secret_key {
  self            = [super init];
  if (self) {
  secretKey       = secret_key;
  stringEncrypt   = [[StringEncryption alloc] init];
  _sha256Key      = [stringEncrypt sha256:secretKey length:SHA256_ENCRYPT_LENGTH];
  }
  return self;
}
- (void)EncryptMessage:(NSString *)message
          onCompletion:
              (void (^)(NSData *encryptedData, NSString *IV))completion {

  NSData *IV_Data = [stringEncrypt generateRandomIV:RandomIV_LENGTH];
    NSString *IV_String =[IV_Data hexStringRepresentation];



  NSData *data    = [message dataUsingEncoding:NSUTF8StringEncoding];

    
    NSData *encryptedData =[stringEncrypt encrypt:data key:_sha256Key iv:IV_String];
//  NSString *encrypted_string = [encryptedData hexStringRepresentation];
  completion(encryptedData, IV_String);
}
- (void)DecryptMessage:(NSData *)encryptedData
                 andIV:(NSString *)IV
          onCompletion:(void (^)(NSString *message))completion {
//  NSData *encryptedData =[NSData dataWithHexString:encryptedMessage];
  NSData *decyptedData =[stringEncrypt decrypt:encryptedData key:_sha256Key iv:IV];
    NSString *decryptedString =[[NSString alloc]initWithData:decyptedData encoding:NSUTF8StringEncoding];
  completion(decryptedString);
}

@end
