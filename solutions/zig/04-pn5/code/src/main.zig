const std = @import("std");

var stdin_buffer: [4096]u8 = undefined;
var stdin_reader = std.fs.File.stdin().readerStreaming(&stdin_buffer);
const stdin = &stdin_reader.interface;

var stdout_writer = std.fs.File.stdout().writerStreaming(&.{});
const stdout = &stdout_writer.interface;

pub fn main() !void {
    while (true) {
        try stdout.print("$ ", .{});

        const command = try stdin.takeDelimiter('\n');

        if (std.mem.eql(u8, command.?, "exit")) {
            break;
        }

        try stdout.print("{s}: command not found\n", .{command.?});
    }
}
