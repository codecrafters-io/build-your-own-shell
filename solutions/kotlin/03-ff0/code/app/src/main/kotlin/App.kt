fun main() {
    while (true) {
        print("$ ")
        System.out.flush()
        val command = readLine() ?: return
        println("$command: command not found")
    }
}
