const std = @import("std");
var stdin = std.fs.File.stdin().readerStreaming(&.{});

pub fn main() !void {
    std.debug.print("$ ", .{});
}
