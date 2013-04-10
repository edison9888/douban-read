#import <Foundation/Foundation.h>


@interface BookStatusChangeRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)changeBook:(NSString *)bookId toStatus:(NSString *)status;

- (void)addBook:(NSString *)bookId withStatus:(NSString *)status;

- (void)deleteBook:(NSString *)bookId;


@end