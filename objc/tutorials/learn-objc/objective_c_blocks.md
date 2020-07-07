# [Objective-C Blocks](https://www.tutorialspoint.com/objective_c/objective_c_blocks.htm)

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    void (^simpleBlock)(void) = ^{
        NSLog(@"This is a block");
    };
    simpleBlock();
    return 0;
}
```

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    double (^multiplyTwoValues)(double, double) = ^(double a, double b) {
        return a * b;
    };
    double result = multiplyTwoValues(2, 4);
    NSLog(@"The result is %f", result);
    return 0;
}
```

```objc
#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(void);

@interface SampleClass : NSObject

- (void)performActionWithCompletion:(CompletionBlock)completionBlock;

@end

@implementation SampleClass

- (void)performActionWithCompletion:(CompletionBlock)completionBlock {
    NSLog(@"Action Performed");
    completionBlock();
}

@end

int main(int argc, const char * argv[]) {
    SampleClass *sampleClass = [[SampleClass alloc] init];
    [sampleClass performActionWithCompletion:^{
        NSLog(@"Completion is called to intimate action is performed.");
    }];
    return 0;
}
```