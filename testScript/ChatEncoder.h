//
//  ChatEncoder.h
//  testScript
//
//  Created by RAHUL'S MAC MINI on 01/09/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CryptLib.h"
#define SHA256_ENCRYPT_LENGTH 32
#define RandomIV_LENGTH 16
@interface ChatEncoder : NSObject {
  NSString* secretKey;
  StringEncryption* stringEncrypt;
}
@property(nonatomic, readonly) NSString* sha256Key;
- (instancetype)initWithSecret:(NSString*)secretKey;
- (void)EncryptMessage:(NSString*)message
          onCompletion:
              (void (^)(NSData *encryptedData, NSString* IV))completion;
- (void)DecryptMessage:(NSData*)encryptedData
                 andIV:(NSString*)IV
          onCompletion:(void (^)(NSString* message))completion;

@end
