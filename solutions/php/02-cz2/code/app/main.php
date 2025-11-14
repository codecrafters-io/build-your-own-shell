<?php
error_reporting(E_ALL);

fwrite(STDOUT, "$ ");

// Wait for user input
$command = fgets(STDIN);
if ($command === false) {
    $command = '';
}
$command = rtrim($command, "\r\n");
fwrite(STDOUT, $command . ": command not found\n");
