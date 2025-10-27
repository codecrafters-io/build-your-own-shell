const std = @import("std");

var stdin_buffer: [4096]u8 = undefined;
var stdin_reader = std.fs.File.stdin().readerStreaming(&stdin_buffer);
const stdin = &stdin_reader.interface;

var stdout_buffer: [4096]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writerStreaming(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    try stdout.print("$ ", .{});
    try stdout.flush();

    const command = try stdin.takeDelimiter('\n');
    try stdout.print("{s}: command not found\n", .{command.?});
    try stdout.flush();
}
