const std = @import("std");
var stdin = std.fs.File.stdin().readerStreaming(&.{});
var stdout = std.fs.File.stdout().writerStreaming(&.{});

pub fn main() !void {
    while (true) {
        std.debug.print("$ ", .{});

        var input_buffer: [1024]u8 = undefined;
        var input_len = try stdin.read(&input_buffer);
        if (input_len > 0) input_len -= 1; // Remove the newline character
        const input_slice = input_buffer[0..input_len];

        try stdout.interface.print("{s}: command not found\n", .{input_slice});
    }
}
