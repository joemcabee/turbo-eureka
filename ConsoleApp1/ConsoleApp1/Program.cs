using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            var input = "1~2~~3";
            var output = CalculateTotal(input);
            Console.WriteLine($"Input: {input}");
            Console.WriteLine($"Output: {output}");

            input = "~~~";
            output = CalculateTotal(input);
            Console.WriteLine($"Input: {input}");
            Console.WriteLine($"Output: {output}");

            input = "~1~00~12~~~";
            output = CalculateTotal(input);
            Console.WriteLine($"Input: {input}");
            Console.WriteLine($"Output: {output}");
        }

        private static int CalculateTotal(string input)
        {
            var output = 0;

            //1~2~3
            var inputArrary = input.Split('~', StringSplitOptions.RemoveEmptyEntries);

            foreach (var item in inputArrary)
            {
                int.TryParse(item, out int value);
                output += value;
            }

            return output;
        }
    }
}
