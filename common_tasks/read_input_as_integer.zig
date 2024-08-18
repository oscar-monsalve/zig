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

    std.debug.print("Number: {}\n", .{number});
}
