<?php
error_reporting(E_ALL);

while (true) {
    fwrite(STDOUT, "$ ");

    // Wait for user input
    $command = rtrim(fgets(STDIN), "\r\n");
    fwrite(STDOUT, $command . ": command not found\n");
}
