// Ask the user for a number. Depending on whether the number is even or odd, print out an appropriate message to
// the user. Hint: how does an even / odd number react differently when divided by 2?
//
// Extras:
//
//     - If the number is a multiple of 4, print out a different message.
//     - Ask the user for two numbers: one number to check (call it num) and one number to divide by (check). If
//       check divides evenly into num, tell that to the user. If not, print a different appropriate message.

const std = @import("std");

fn askNumber(alloc: *std.mem.Allocator) !usize {
    const stdin = std.io.getStdIn().reader();

    std.debug.print("Enter an integer number:\n", .{});

    const maxSize = 1024;
    const maybeInput = stdin.readUntilDelimiterOrEofAlloc(alloc.*, '\n', maxSize) catch |err| {
        std.debug.print("Error reading input: {}", .{err});
        return err;
    };

    if (maybeInput) |input| {
        defer alloc.free(input);
        const age = std.fmt.parseInt(usize, input, 10) catch |err| {
            std.debug.print("Failed to parse integer: {}\n", .{err});
            return err;
        };

        return age;
    } else {
        return error.InvalidInput;
    }
}

pub fn main() !void {
    var alloc = std.heap.page_allocator;

    const number = try askNumber(&alloc);

    if (number % 2 == 0) {
        std.debug.print("You entered: {}. It is even.\n", .{number});
    }
    if (number % 2 != 0) {
        std.debug.print("You entered: {}. It is odd.\n", .{number});
    }
    if (number % 4 == 0) {
        std.debug.print("And {} it is also a multiple of 4.\n\n", .{number});
    }

    const num = try askNumber(&alloc);
    const check = try askNumber(&alloc);

    if (num % check == 0) {
        std.debug.print("The number {} is evenly divisible by {}.\n", .{ num, check });
    } else {
        std.debug.print("The number {} is not evenly divisible by {}.\n", .{ num, check });
    }
}
