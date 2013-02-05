#import "BookDetailViewController.h"
#import "BookDetailView.h"
#import "DOUBook.h"
#import "BookStatusChangeRequest.h"
#import "ReadingBookDetailView.h"
#import "BooksViewController.h"
#import "WishBookDetailView.h"
#import "ReadBookDetailView.h"


@implementation BookDetailViewController {
    BookDetailView *detailView;
    DOUBook *book;
    BooksViewController *booksViewController;
}

- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BooksViewController *)theBooksViewController {
    self = [super init];
    if (self) {
        book = theBook;
        booksViewController = theBooksViewController;
    }
    return self;
}

- (void)loadView {
    switch ([book status]) {
        case READING:
            detailView = [[ReadingBookDetailView alloc] initWithBook:book andTarget:self];
            break;
        case WISH:
            detailView = [[WishBookDetailView alloc] initWithBook:book andTarget:self];
            break;
        case READ:
            detailView = [[ReadBookDetailView alloc] initWithBook:book andTarget:self];
            break;
    }
    self.view = detailView;
}

- (void)finishReading {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request changeBook:[book id] toStatus:@"read"];
}

- (void)wishRead {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request changeBook:[book id] toStatus:@"wish"];
}

- (void)reading {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request changeBook:[book id] toStatus:@"reading"];
}

- (void)bookChangeRequestDidFinish {
    NSLog(@"book change request finished");
    [[self navigationController] popViewControllerAnimated:YES];
    [booksViewController bookStatusChanged:book];
}
@end