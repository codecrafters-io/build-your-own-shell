class Program
{
    static void Main()
    {
        Console.Write("$ ");

        // Wait for user input
        var command = Console.ReadLine();
        Console.WriteLine($"{command}: command not found");
    }
}
