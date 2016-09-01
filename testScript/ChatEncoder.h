//
//  ChatEncoder.h
//  testScript
//
//  Created by RAHUL'S MAC MINI on 01/09/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CryptLib.h"
#define ENCRYPT_LENGTH 5
@interface ChatEncoder : NSObject {
  NSString* secretKey;
  StringEncryption* stringEncrypt;
}
@property(nonatomic, readonly) NSString* sha256Key;
- (instancetype)initWithSecret:(NSString*)secretKey;
- (void)EncryptMessage:(NSString*)message
          onCompletion:
              (void (^)(NSString* encryptedMessage, NSString* IV))completion;
- (void)DecryptMessage:(NSString*)encryptedMessage
                 andIV:(NSString*)IV
          onCompletion:(void (^)(NSString* message))completion;

@end
