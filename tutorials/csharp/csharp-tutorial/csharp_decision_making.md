# [C# - Decision Making](https://www.tutorialspoint.com/csharp/csharp_decision_making.htm)

## [C# - `if` Statement](https://www.tutorialspoint.com/csharp/if_statement_in_csharp.htm)

```c#
using System;

namespace DecisionMaking
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 10;

            if (a < 20)
            {
                Console.WriteLine("a is less than 20");
            }
            Console.WriteLine("value of a is: {0}", a);
            Console.ReadLine();
        }

    }
}
```

## [C# - `if...else` Statement](https://www.tutorialspoint.com/csharp/if_else_statement_in_csharp.htm)

```c#
using System;

namespace DecisionMaking
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 100;

            if (a < 20)
            {
                Console.WriteLine("a is less than 20");
            }
            else
            {
                Console.WriteLine("a is not less than 20");
            }
            Console.WriteLine("value of a is: {0}", a);
            Console.ReadLine();
        }

    }
}
```

```c#
using System;

namespace DecisionMaking
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 100;

            if (a == 10)
            {
                Console.WriteLine("Value of a is 10");
            }
            else if (a == 20)
            {
                Console.WriteLine("Value of a is 20");
            }
            else if (a == 30)
            {
                Console.WriteLine("Value of a is 30");
            }
            else
            {
                Console.WriteLine("None of the values is matching");
            }
            Console.WriteLine("value of a is: {0}", a);
            Console.ReadLine();
        }

    }
}
```

## [C# - Nested `if` Statements](https://www.tutorialspoint.com/csharp/nested_if_statements_in_csharp.htm)

```c#
using System;

namespace DecisionMaking
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 100;
            int b = 200;

            if (a == 100)
            {
                if (b == 200)
                {
                    Console.WriteLine("Value of a is 100 and b is 200");
                }
            }

            Console.WriteLine("Exact value of a is {0}", a);
            Console.WriteLine("Exact value of b is {0}", b);
            Console.ReadLine();
        }

    }
}
```

## [C# - `switch` Statement](https://www.tutorialspoint.com/csharp/switch_statement_in_csharp.htm)

```c#
using System;

namespace DecisionMaking
{
    class Program
    {
        public static void Main(string[] args)
        {
            char grade = 'B';

            switch (grade)
            {
                case 'A':
                    Console.WriteLine("Excellent!");
                    break;
                case 'B':
                case 'C':
                    Console.WriteLine("Well done");
                    break;
                case 'D':
                    Console.WriteLine("You passed");
                    break;
                case 'F':
                    Console.WriteLine("Better try again");
                    break;
                default:
                    Console.WriteLine("Invalid grade");
                    break;
            }
            Console.WriteLine("Your grade is {0}", grade);
            Console.ReadLine();
        }

    }
}
```

## [C# - nested `switch` Statements](https://www.tutorialspoint.com/csharp/nested_switch_statements_in_csharp.htm)

```c#
using System;

namespace DecisionMaking
{
    class Program
    {
        public static void Main(string[] args)
        {
            int a = 100;
            int b = 200;

            switch (a)
            {
                case 100:
                    Console.WriteLine("This is part of outer switch");

                    switch (b)
                    {
                        case 200:
                            Console.WriteLine("This is part of inner switch");
                            break;
                    }
                    break;
            }
            Console.WriteLine("Exact value of a is {0}", a);
            Console.WriteLine("Exact value of b is {0}", b);
            Console.ReadLine();
        }

    }
}
```
