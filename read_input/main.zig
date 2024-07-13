const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();

    var buffer: [1024]u8 = undefined;

    std.debug.print("What is your name?: ", .{});

    const res = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

    if (res) |value| {
        std.debug.print("You entered: {s}\n", .{value});
    } else {
        std.debug.print("An error ocurred, value is null", .{});
    }
}
