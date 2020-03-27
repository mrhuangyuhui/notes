# [C# - Constants and Literals](https://www.tutorialspoint.com/csharp/csharp_constants.htm)

```c#
using System;

namespace EscapeChar
{
    class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Hello\tWorld\n\n");
            Console.ReadLine();
        }

    }
}
```

```c#
using System;

namespace DeclaringConstants
{
    class Program
    {
        public static void Main(string[] args)
        {
            const double pi = 3.14159;

            double r;
            Console.WriteLine("Enter Radius: ");
            r = Convert.ToDouble(Console.ReadLine());

            double areaCircle = pi * r * r;
            Console.WriteLine("Radius: {0}, Area: {1}", r, areaCircle);
            Console.ReadLine();
        }

    }
}
```
