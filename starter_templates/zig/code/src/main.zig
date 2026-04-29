const std = @import("std");

pub fn main(init: std.process.Init) !void {
    var stdout = std.Io.File.stdout().writer(init.io, &.{});

    // Suppress unused local constant error. Feel free to remove the line below.
    try stdout.interface.print("", .{});

    // TODO: Uncomment the code below to pass the first stage
    // try stdout.interface.print("$ ", .{});
}
