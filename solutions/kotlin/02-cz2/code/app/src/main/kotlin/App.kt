fun main() {
    print("$ ")
    System.out.flush()
    val command = readLine() ?: return
    println("$command: command not found")
}
