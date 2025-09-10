const std = @import("std");
var stdin = std.fs.File.stdin().readerStreaming(&.{});

pub fn main() !void {
    // Uncomment this block to pass the first stage
    // std.debug.print("$ ", .{});

    var input_buffer: [1024]u8 = undefined;
    const input_len = try stdin.read(&input_buffer);
    _ = input_buffer[0 .. input_len - 1]; // TODO: Handle user input
}
