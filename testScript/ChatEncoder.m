//
//  ChatEncoder.m
//  testScript
//
//  Created by RAHUL'S MAC MINI on 01/09/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "ChatEncoder.h"

@implementation ChatEncoder

- (instancetype)initWithSecret:(NSString*)secret_key {
  self = [super init];
  if (self) {
    secretKey = secret_key;
    stringEncrypt = [[StringEncryption alloc] init];
    _sha256Key = [stringEncrypt sha256:secretKey length:ENCRYPT_LENGTH];
  }
  return self;
}
- (void)EncryptMessage:(NSString*)message
          onCompletion:
              (void (^)(NSString* encryptedMessage, NSString* IV))completion {
  NSData* data = [message dataUsingEncoding:NSUTF8StringEncoding];
  NSData* IV_Data = [stringEncrypt generateRandomIV:ENCRYPT_LENGTH];
  NSString* IV_String =
      [[NSString alloc] initWithData:IV_Data encoding:NSUTF8StringEncoding];
  NSData* encryptedData =
      [stringEncrypt encrypt:data key:secretKey iv:IV_String];
  NSString* encrypted_string =
      [[NSString alloc] initWithData:encryptedData
                            encoding:NSUTF8StringEncoding];
  completion(encrypted_string, IV_String);
}
- (void)DecryptMessage:(NSString*)encryptedMessage
                 andIV:(NSString*)IV
          onCompletion:(void (^)(NSString* message))completion {
  NSData* encryptedData =
      [encryptedMessage dataUsingEncoding:NSUTF8StringEncoding];
  NSData* decyptedData =
      [stringEncrypt decrypt:encryptedData key:secretKey iv:IV];
  NSString* decryptedString =
      [[NSString alloc] initWithData:decyptedData
                            encoding:NSUTF8StringEncoding];
  completion(decryptedString);
}

@end
