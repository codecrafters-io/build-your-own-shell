const std = @import("std");

pub fn main(init: std.process.Init) !void {
    var stdin_buffer: [4096]u8 = undefined;
    var stdin = std.Io.File.stdin().readerStreaming(init.io, &stdin_buffer);
    var stdout = std.Io.File.stdout().writer(init.io, &.{});

    while (true) {
        try stdout.interface.print("$ ", .{});
        const command = try stdin.interface.takeDelimiter('\n');

        if (std.mem.eql(u8, command.?, "exit")) {
            break;
        } else if (std.mem.startsWith(u8, command.?, "echo ")) {
            try stdout.interface.print("{s}\n", .{command.?[5..]});
        } else {
            try stdout.interface.print("{s}: command not found\n", .{command.?});
        }
    }
}
