const std = @import("std");

var in_buf: [1024]u8 = undefined;
var out_buf: [1024]u8 = undefined;

var reader_impl = std.fs.File.stdin().reader(&in_buf);
var writer_impl = std.fs.File.stdout().writer(&out_buf);

const stdin = &reader_impl.interface;
const stdout = &writer_impl.interface;

pub fn main() !void {
    try stdout.print("$ ", .{});
    try stdout.flush();

    const command = try stdin.takeDelimiterExclusive('\n');

    try stdout.print("{s}: command not found\n", .{command});
    try stdout.flush();
}
