# [Objective-C Arrays](https://www.tutorialspoint.com/objective_c/objective_c_arrays.htm)

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int n[10];
    for (int i = 0; i < 10; i++) {
        n[i] = i + 100;
    }
    for (int i = 0; i < 10; i++) {
        NSLog(@"Element[%d] = %d\n", i, n[i]);
    }
    return 0;
}
```

Multi-dimensional arrays in Objective-C

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int a[5][2] = {{0, 0}, {1, 2}, {2, 4}, {3, 6}, {4, 8}};
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 2; j++) {
            NSLog(@"a[%d][%d] = %d\n", i, j, a[i][j]);
        }
    }
    return 0;
}
```

Passing Arrays as Function Arguments in Objective-C

```objc
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject

- (double)averageWithArray:(int [])arr andSize:(int)size;

@end

@implementation SampleClass

- (double)averageWithArray:(int [])arr andSize:(int)size {
    double sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    double avg = sum / size;
    return avg;
}

@end

int main(int argc, const char * argv[]) {
    int balance[5] = {1000, 2, 3, 17, 50};
    double avg;
    SampleClass *sampleClass = [[SampleClass alloc] init];
    avg = [sampleClass averageWithArray:balance andSize:5];
    NSLog(@"Average value is: %f", avg);
    return 0;
}
```

Return array from function in Objective-C

```objc
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject

- (int *)getRandom;

@end

@implementation SampleClass

- (int *)getRandom {
    static int r[10];
    srand((unsigned)time(NULL));
    for (int i = 0; i < 10; i++) {
        r[i] = rand();
        NSLog(@"r[%d] = %d\n", i, r[i]);
    }
    return r;
}

@end

int main(int argc, const char * argv[]) {
    SampleClass *sampleClass = [[SampleClass alloc] init];
    int *p = [sampleClass getRandom];
    for (int i = 0; i < 10; i++) {
        NSLog(@"*(p + %d): %d\n", i, *(p + i));
    }
    return 0;
}
```

Pointer to an Array in Objective-C

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    double balance[5] = {1000.0, 2.0, 3.4, 17.0, 50.0};
    double *p = balance;

    for (int i = 0; i < 5; i++) {
        NSLog(@"*(p + %d): %f\n", i, *(p + i));
    }

    for (int i = 0; i < 5; i++) {
        NSLog(@"*(balance + %d): %f\n", i, *(balance + i));
    }

    return 0;
}
```