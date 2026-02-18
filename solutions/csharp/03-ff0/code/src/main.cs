class Program
{
    static void Main()
    {
        while (true)
        {
            Console.Write("$ ");

            // Wait for user input
            var command = Console.ReadLine();
            Console.WriteLine($"{command}: command not found");
        }
    }
}
