# [C# - Loops](https://www.tutorialspoint.com/csharp/csharp_loops.htm)

## [C# - While Loop](https://www.tutorialspoint.com/csharp/csharp_while_loop.htm)

```c#
using System;

namespace Loops
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 10;

            while (a < 20)
            {
                Console.WriteLine("value of a: {0}", a);
                a++;
            }
            Console.ReadLine();
        }

    }
}
```

## [C# - For Loop](https://www.tutorialspoint.com/csharp/csharp_for_loop.htm)

```c#
using System;

namespace Loops
{
    class Program
    {
        public static void Main(string[] args)
        {
            for (int a = 10; a < 20; a++)
            {
                Console.WriteLine("value of a: {0}", a);
            }
            Console.ReadLine();
        }

    }
}
```
