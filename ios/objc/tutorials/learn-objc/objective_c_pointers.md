# [Objective-C Pointers](https://www.tutorialspoint.com/objective_c/objective_c_pointers.htm)

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int var1;
    char var2[10];

    NSLog(@"Address of var1 variable: %p\n", &var1);
    NSLog(@"Address of var2 variable: %p\n", &var2);
    return 0;
}
```

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int var = 20;
    int *ip;
    ip = &var;

    NSLog(@"Address of var variable: %p\n", &var);

    NSLog(@"Address stored in ip variable: %p\n", ip);

    NSLog(@"Value of *ip variable: %d\n", *ip);

    return 0;
}
```

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int *ptr = NULL;
    NSLog(@"The value of ptr is: %p\n", ptr);
    return 0;
}
```

## [Objective-C - Pointer Arithmetic](https://www.tutorialspoint.com/objective_c/objective_c_pointer_arithmetic.htm)

### Incrementing a Pointer

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int var[] = {10, 100, 200};
    int *ptr = var;

    for (int i = 0; i < 3; i++) {
        NSLog(@"Address of var[%d] = %p\n", i, ptr);
        NSLog(@"Value of var[%d] = %d\n", i, *ptr);
        ptr++;
    }

    return 0;
}
```

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int var[] = {10, 100, 200};
    int *ptr = &var[2];

    for (int i = 2; i >= 0; i--) {
        NSLog(@"Address of var[%d] = %p\n", i, ptr);
        NSLog(@"Value of var[%d] = %d\n", i, *ptr);
        ptr--;
    }

    return 0;
}
```

### Pointer Comparisons

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int var[] = {10, 100, 200};
    int *ptr = var;
    int i = 0;

    while (ptr <= &var[2]) {
        NSLog(@"Address of var[%d] = %p\n", i, ptr);
        NSLog(@"Value of var[%d] = %d\n", i, *ptr);
        ptr++;
        i++;
    }

    return 0;
}
```

## [Objective-C - Array of Pointers](https://www.tutorialspoint.com/objective_c/objective_c_array_of_pointers.htm)

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int var[] = {10, 100, 200};
    int *ptr[3];

    for (int i = 0; i < 3; i++) {
        ptr[i] = &var[i];
    }

    for (int i = 0; i < 3; i++) {
        NSLog(@"Value of var[%d] = %d\n", i, *ptr[i]);
    }

    return 0;
}
```

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    char *names[] = {"Zara Ali", "Hina Ali", "Nuha Ali", "Sara Ali"};
    for (int i = 0; i < 4; i++) {
        NSLog(@"Value of names[%d] = %s\n", i, names[i]);
    }
    return 0;
}
```

## [Objective-C - Pointer to Pointer](https://www.tutorialspoint.com/objective_c/objective_c_pointer_to_pointer.htm)

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int var = 3000;
    int *ptr;
    int **pptr;

    ptr = &var;
    pptr = &ptr;

    NSLog(@"Value of var = %d\n", var);
    NSLog(@"Value available at *ptr = %d\n", *ptr);
    NSLog(@"Value available at **pptr = %d\n", **pptr);

    return 0;
}
```

## [Passing Pointers to Functions in Objective-C](https://www.tutorialspoint.com/objective_c/objective_c_passing_pointers_to_functions.htm)

```objc
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject

- (void)getSeconds:(int *)sec;

@end

@implementation SampleClass

- (void)getSeconds:(int *)sec {
    *sec = time(NULL);
}

@end

int main(int argc, const char * argv[]) {
    int sec;
    SampleClass *sampleClass = [[SampleClass alloc] init];
    [sampleClass getSeconds:&sec];
    NSLog(@"Number of seconds: %d\n", sec);
    return 0;
}
```

```objc
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject

- (double)getAverage:(int *)arr ofSize:(int)size;

@end

@implementation SampleClass

- (double)getAverage:(int *)arr ofSize:(int)size {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    double avg = (double)sum / size;
    return avg;
}

@end

int main(int argc, const char * argv[]) {
    int balance[5] = {1000, 2, 3, 17, 50};
    SampleClass *sampleClass = [[SampleClass alloc] init];
    double avg = [sampleClass getAverage:balance ofSize:5];
    NSLog(@"Average value is: %f\n", avg);
    return 0;
}
```

## [Return Pointer From Functions in Objective-C](https://www.tutorialspoint.com/objective_c/objective_c_return_pointer_from_functions.htm)

```objc
#import <Foundation/Foundation.h>

int * getRandom() {
    static int r[10];
    srand((unsigned)time(NULL));

    for (int i = 0; i < 10; i++) {
        r[i] = rand();
        NSLog(@"%d\n", r[i]);
    }

    return r;
}

int main(int argc, const char * argv[]) {
    int *p = getRandom();
    for (int i = 0; i < 10; i++) {
        NSLog(@"*(p + %d): %d\n", i, *(p + i));
    }
    return 0;
}
```