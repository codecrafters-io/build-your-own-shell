import sys


def main():
    while True:
        sys.stdout.write("$ ")

        # Wait for user input
        command = input()
        if command == "exit":
            break
        elif command.startswith("echo "):
            print(command[5:])
        else:
            print(f"{command}: command not found")


if __name__ == "__main__":
    main()
