// Create a program that asks the user to enter their name and their age. Print out a message addressed to them that
// tells them the year that they will turn 100 years old. Note: for this exercise, the expectation is that you
// explicitly write out the year (and therefore be out of date the next year).
//
// Extras:
//
//   - Add on to the previous program by asking the user for another number and printing out that many copies of the
//   previous message. (Hint: order of operations exists in Python).
//   - Print out that many copies of the previous message on separate lines. (Hint: the string "\n is the same as
//   pressing the ENTER button).

const std = @import("std");

fn askName(alloc: *std.mem.Allocator) ![]u8 {
    const stdin = std.io.getStdIn().reader();

    std.debug.print("Input your name:\n", .{});

    const maxSize = 1024;
    const maybeName = try stdin.readUntilDelimiterOrEofAlloc(alloc.*, '\n', maxSize); // Dereference alloc.

    if (maybeName) |input| {
        return input;
    } else {
        return &[_]u8{}; // Return an empty slice.
    }
}

fn askAge(alloc: *std.mem.Allocator) !usize {
    const stdin = std.io.getStdIn().reader();

    std.debug.print("What is your age?\n", .{});

    const maxSize = 1024;
    const maybeInput = stdin.readUntilDelimiterOrEofAlloc(alloc.*, '\n', maxSize) catch |err| {
        std.debug.print("Error reading input: {}", .{err});
        return err;
    };

    if (maybeInput) |input| {
        const age = std.fmt.parseInt(usize, input, 10) catch |err| {
            std.debug.print("Failed to parse integer: {}\n", .{err});
            return err;
        };

        return age;
    } else {
        return error.InvalidInput;
    }
}

// For the extra poits
fn askNumber(alloc: *std.mem.Allocator) !usize {
    const stdin = std.io.getStdIn().reader();

    std.debug.print("Enter an integer number:\n", .{});

    const maxSize = 1024;
    const maybeInput = stdin.readUntilDelimiterOrEofAlloc(alloc.*, '\n', maxSize) catch |err| {
        std.debug.print("Error reading input: {}", .{err});
        return err;
    };

    if (maybeInput) |input| {
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

    const name = try askName(&alloc);
    if (name.len > 0) {
        defer alloc.free(name);
        std.debug.print("Your name is: {s}\n\n", .{name});

        const age = try askAge(&alloc);
        std.debug.print("Your age is: {}\n\n", .{age});

        const currentYear = 2024;
        const yearsLeft = 100 - age;
        const turningYear = yearsLeft + currentYear;

        std.debug.print("{s}, you will be 100 years old in {}\n\n", .{ name, turningYear });

        const number = try askNumber(&alloc);

        for (0..number) |_| {
            std.debug.print("{s}, you will be 100 years old in {}\n", .{ name, turningYear });
        }
    } else {
        std.debug.print("No name entered.\n\n", .{});
    }
}
