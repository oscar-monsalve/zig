// Take a list, say for example this one:
//
//   a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
//
// and write a program that prints out all the elements of the list that are less than 5.
//
// Extras:
//
//     - Instead of printing the elements one by one, make a new list that has all the elements less than 5 from this
//       list in it and print out this new list.
//     - Ask the user for a number and return a list that contains only elements from the original list a that are
//       smaller than that number given by the user.

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
    const list = [_]u8{ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 };

    var alloc = std.heap.page_allocator;
    var newList1 = std.ArrayList(u8).init(alloc);
    defer newList1.deinit();

    for (list) |value| {
        if (value < 5) {
            try newList1.append(value);
        }
    }

    std.debug.print("New list with <5: {any}\n", .{newList1.items});

    // Ask for a number and print the number less than this number.
    const number = try askNumber(&alloc);

    var newList2 = std.ArrayList(u8).init(alloc);
    defer newList2.deinit();

    for (list) |value| {
        if (value < number) {
            try newList2.append(value);
        }
    }

    std.debug.print("New list < than user input ({}): {any}\n", .{ number, newList2.items });
}
