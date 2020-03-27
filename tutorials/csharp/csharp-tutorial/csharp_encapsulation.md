# [C# - Encapsulation](https://www.tutorialspoint.com/csharp/csharp_encapsulation.htm)

## Public Access Specifier

```c#
using System;

namespace RectangleApplication
{
    class Rectangle
    {
        public double length;
        public double width;

        public double GetArea()
        {
            return length * width;
        }

        public void Display()
        {
            Console.WriteLine("Length: {0}", length);
            Console.WriteLine("Width: {0}", width);
            Console.WriteLine("Area: {0}", GetArea());
        }
    }

    class ExecuteRectangle
    {
        public static void Main(string[] args)
        {
            Rectangle r = new Rectangle();
            r.length = 4.5;
            r.width = 3.5;
            r.Display();
            Console.ReadLine();
        }
    }
}
```

## Private Access Specifier

```c#
using System;

namespace RectangleApplication
{
    class Rectangle
    {
        private double length;
        private double width;

        public void AcceptDetails()
        {
            Console.WriteLine("Enter Length: ");
            length = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Enter Width: ");
            width = Convert.ToDouble(Console.ReadLine());
        }

        public double GetArea()
        {
            return length * width;
        }

        public void Display()
        {
            Console.WriteLine("Length: {0}", length);
            Console.WriteLine("Width: {0}", width);
            Console.WriteLine("Area: {0}", GetArea());
        }
    }

    class ExecuteRectangle
    {
        public static void Main(string[] args)
        {
            Rectangle r = new Rectangle();
            r.AcceptDetails();
            r.Display();
            Console.ReadLine();
        }
    }
}
```

## Internal Access Specifier

```c#
using System;

namespace RectangleApplication
{
    class Rectangle
    {
        internal double length;
        internal double width;

        // 默认是 private
        double GetArea()
        {
            return length * width;
        }

        public void Display()
        {
            Console.WriteLine("Length: {0}", length);
            Console.WriteLine("Width: {0}", width);
            Console.WriteLine("Area: {0}", GetArea());
        }
    }

    class ExecuteRectangle
    {
        public static void Main(string[] args)
        {
            Rectangle r = new Rectangle();
            r.length = 4.5;
            r.width = 3.5;
            r.Display();
            Console.ReadLine();
        }
    }
}
```
