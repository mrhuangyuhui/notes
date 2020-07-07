# [Objective-C Functions](https://www.tutorialspoint.com/objective_c/objective_c_functions.htm)

```objc
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject

- (int)maxWithNum1:(int)num1 andNum2:(int)num2;

@end

@implementation SampleClass

- (int)maxWithNum1:(int)num1 andNum2:(int)num2 {
    if (num1 > num2) {
        return num1;
    }
    return num2;
}

@end

int main(int argc, const char * argv[]) {
    int a = 100;
    int b = 200;
    int result;
    SampleClass *sampleClass = [[SampleClass alloc] init];
    result = [sampleClass maxWithNum1:a andNum2:b];
    NSLog(@"Max value is: %d\n", result);
    return 0;
}
```

Function call by value in Objective-C

```objc
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject

- (void)swapWithNum1:(int)num1 andNum2:(int)num2;

@end

@implementation SampleClass

- (void)swapWithNum1:(int)num1 andNum2:(int)num2 {
    int temp;
    temp = num1;
    num1 = num2;
    num2 = temp;
}

@end

int main(int argc, const char * argv[]) {
    int a = 100;
    int b = 200;
    NSLog(@"Before swap, value of a: %d, b: %d", a, b);

    SampleClass *sampleClass = [[SampleClass alloc] init];
    [sampleClass swapWithNum1:a andNum2:b];

    NSLog(@"After swap, value of a: %d, b: %d", a, b);
    return 0;
}
```

Function call by reference in Objective-C

```objc
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject

- (void)swapWithNum1:(int *)num1 andNum2:(int *)num2;

@end

@implementation SampleClass

- (void)swapWithNum1:(int *)num1 andNum2:(int *)num2 {
    int temp;
    temp = *num1;
    *num1 = *num2;
    *num2 = temp;
}

@end

int main(int argc, const char * argv[]) {
    int a = 100;
    int b = 200;
    NSLog(@"Before swap, value of a: %d, b: %d", a, b);

    SampleClass *sampleClass = [[SampleClass alloc] init];
    [sampleClass swapWithNum1:&a andNum2:&b];

    NSLog(@"After swap, value of a: %d, b: %d", a, b);
    return 0;
}
```