// A leap year (in the Gregorian calendar) occurs:
//
// In every year that is evenly divisible by 4.
// Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly
// divisible by 400.
// Some examples:
//
// 1997 was not a leap year as it's not divisible by 4.
// 1900 was not a leap year as it's not divisible by 400.
// 2000 was a leap year!

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
