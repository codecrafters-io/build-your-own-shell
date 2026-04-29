const std = @import("std");

pub fn main(init: std.process.Init) !void {
    var stdin_buffer: [4096]u8 = undefined;
    var stdin = std.Io.File.stdin().readerStreaming(init.io, &stdin_buffer);
    var stdout = std.Io.File.stdout().writer(init.io, &.{});

    try stdout.interface.print("$ ", .{});

    const command = try stdin.interface.takeDelimiter('\n');
    try stdout.interface.print("{s}: command not found\n", .{command.?});
}
