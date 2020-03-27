# [C# - Operators](https://www.tutorialspoint.com/csharp/csharp_operators.htm)

## Arithmetic Operators

```c#
using System;

namespace ArithmeticOperators
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 21;
            int b = 10;
            int c;

            c = a + b;
            Console.WriteLine("Line 1 - Value of c is {0}", c);

            c = a - b;
            Console.WriteLine("Line 2 - Value of c is {0}", c);

            c = a * b;
            Console.WriteLine("Line 3 - Value of c is {0}", c);

            c = a / b;
            Console.WriteLine("Line 4 - Value of c is {0}", c);

            c = a % b;
            Console.WriteLine("Line 5 - Value of c is {0}", c);

            c = a++;
            Console.WriteLine("Line 6 - Value of c is {0}", c);

            c = a--;
            Console.WriteLine("Line 7 - Value of c is {0}", c);
            Console.ReadLine();
        }

    }
}
```

## Relational Operators

```c#
using System;

namespace RelationalOperators
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 21;
            int b = 10;

            if (a == b)
            {
                Console.WriteLine("Line 1 - a is equal to b");
            }
            else
            {
                Console.WriteLine("Line 1 - a is not equal to b");
            }

            if (a < b)
            {
                Console.WriteLine("Line 1 - a is less than b");
            }
            else
            {
                Console.WriteLine("Line 1 - a is not less than b");
            }

            if (a > b)
            {
                Console.WriteLine("Line 1 - a is greater than b");
            }
            else
            {
                Console.WriteLine("Line 1 - a is not greater than b");
            }

            a = 5;
            b = 20;

            if (a <= b)
            {
                Console.WriteLine("Line 4 - a is either less than or equal to b");
            }

            if (b >= a)
            {
                Console.WriteLine("Line 5 - b is either greater than or equal to a");
            }

        }

    }
}
```

## Logical Operators

```c#
using System;

namespace LogicalOperators
{
    class Program
    {
        public static void Main(string[] args)
        {
            bool a = true;
            bool b = true;

            if (a && b)
            {
                Console.WriteLine("Line 1 - Condition is true");
            }

            if (a || b)
            {
                Console.WriteLine("Line 2 - Condition is true");
            }

            a = false;
            b = true;

            if (a && b)
            {
                Console.WriteLine("Line 3 - Condition is true");
            }
            else
            {
                Console.WriteLine("Line 3 - Condition is not true");
            }

            if (!(a && b))
            {
                Console.WriteLine("Line 4 - Condition is true");
            }
            Console.ReadLine();
        }

    }
}
```

## Assignment Operators

```c#
using System;

namespace AssignmentOperators
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 21;
            int c;
            c = a;
            Console.WriteLine("Line 1 - = Value of c = {0}", c);

            c += a;
            Console.WriteLine("Line 2 - += Value of c = {0}", c);

            c -= a;
            Console.WriteLine("Line 3 - -= Value of c = {0}", c);

            c *= a;
            Console.WriteLine("Line 4 - *= Value of c = {0}", c);

            c /= a;
            Console.WriteLine("Line 5 - /= Value of c = {0}", c);

            c = 200;
            c %= a;
            Console.WriteLine("Line 6 - %= Value of c = {0}", c);

            Console.ReadLine();
        }

    }
}
```

## Miscellaneous Operators

```c#
using System;

namespace MiscellaneousOperators
{
    class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("The size of int is {0}", sizeof(int));
            Console.WriteLine("The size of short is {0}", sizeof(short));
            Console.WriteLine("The size of double is {0}", sizeof(double));

            int a, b;
            a = 10;
            b = (a == 1) ? 20 : 30;
            Console.WriteLine("Value of b is {0}", b);

            b = (a == 10) ? 20 : 30;
            Console.WriteLine("Value of b is {0}", b);

            Console.ReadLine();
        }

    }
}
```
