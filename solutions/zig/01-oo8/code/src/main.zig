const std = @import("std");
var stdin = std.fs.File.stdin().readerStreaming(&.{});

pub fn main() !void {
    std.debug.print("$ ", .{});

    var input_buffer: [1024]u8 = undefined;
    var input_len = try stdin.read(&input_buffer);

    if (input_len > 0) input_len -= 1; // Remove the newline character
    _ = input_buffer[0..input_len]; // TODO: Handle user input
}
