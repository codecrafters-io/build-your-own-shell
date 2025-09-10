const std = @import("std");
var stdin = std.fs.File.stdin().readerStreaming(&.{});
var stdout = std.fs.File.stdout().writerStreaming(&.{});

pub fn main() !void {
    std.debug.print("$ ", .{});

    var input_buffer: [1024]u8 = undefined;
    const input_len = try stdin.read(&input_buffer);
    const input_slice = input_buffer[0 .. input_len - 1];

    try stdout.interface.print("{s}: command not found\n", .{input_slice});
}
