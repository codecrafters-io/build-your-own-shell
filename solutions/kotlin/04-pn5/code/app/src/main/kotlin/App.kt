fun main() {
    while (true) {
        print("$ ")
        System.out.flush()
        val command = readLine() ?: return
        if (command == "exit") {
            return
        }
        println("$command: command not found")
    }
}
