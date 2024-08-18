const std = @import("std");

pub fn main() !void {
    const str = "69"; // Fixed string containing an integer

    // Attempt to parse the integer from the string
    const parse_result = std.fmt.parseInt(usize, str, 10) catch |err| {
        return std.debug.print("Failed to parse integer: {}\n", .{err});
    };

    // If parsing is successful, parse_result will hold the integer value
    std.debug.print("Parsed integer: {}\n", .{parse_result});
}
