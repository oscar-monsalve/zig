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

fn askUser() ![]const u8 {
    const stdin = std.io.getStdIn().reader();
    var buffer: [2048]u8 = undefined;

    std.debug.print("Enter a year: ", .{});

    const res = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

    if (res) |value| {
        return value;
    } else {
        return error.InputError;
    }
}

fn stringToInt(input: []const u8) !u32 {
    return std.fmt.parseInt(u32, input, 10);
}

pub fn main() !void {
    // const stdout = std.io.getStdOut().writer();
    const res = try askUser();
    // const res = "11";

    std.debug.print("Type before conversion: {}\n", .{@TypeOf(res)});

    const stringResult = stringToInt(res) catch |err| {
        std.debug.print("Error parsing integer: {}\n", .{err});
        return;
    };

    std.debug.print("Type after conversion: {}\n", .{@TypeOf(stringResult)});

    // If "\n" is not written, you get weird outputs
    // try stdout.print("Type before conversion: {}\nType after conversion: {}\n", .{ @TypeOf(res), @TypeOf(stringResult) });

    // This printing method does not print correctly the string
    // std.debug.print("You entered: {s}", .{res});

}
