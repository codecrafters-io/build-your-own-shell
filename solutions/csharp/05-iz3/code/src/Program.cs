class Program
{
    static void Main()
    {
        while (true)
        {
            Console.Write("$ ");

            // Wait for user input
            var command = Console.ReadLine();
            if (command == "exit")
            {
                break;
            }
            else if (command.StartsWith("echo "))
            {
                Console.WriteLine(command[5..]);
            }
            else
            {
                Console.WriteLine($"{command}: command not found");
            }
        }
    }
}
