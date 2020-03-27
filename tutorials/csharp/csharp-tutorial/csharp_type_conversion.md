# [C# - Type Conversion](https://www.tutorialspoint.com/csharp/csharp_type_conversion.htm)

```c#
using System;

namespace TypeConversionApplication
{
    class ExplicitConversion
    {
        public static void Main(string[] args)
        {
            double d = 5673.74;
            int i;

            i = (int)d;
            Console.WriteLine(i);
            Console.ReadKey();
        }
    }
}
```

```c#
using System;

namespace TypeConversionApplication
{
    class StringConversion
    {
        public static void Main(string[] args)
        {
            int i = 75;
            float f = 53.005f;
            double d = 2345.7652;
            bool b = true;

            Console.WriteLine(i.ToString());
            Console.WriteLine(f.ToString());
            Console.WriteLine(d.ToString());
            Console.WriteLine(b.ToString());
            Console.ReadKey();
        }
    }
}
```
