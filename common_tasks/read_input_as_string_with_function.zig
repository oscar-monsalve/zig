const std = @import("std");

fn askName(alloc: *std.mem.Allocator) ![]u8 {
    const stdin = std.io.getStdIn().reader();

    std.debug.print("Input your name:\n", .{});

    const maxLineSize = 1024;
    const maybeInput = try stdin.readUntilDelimiterOrEofAlloc(alloc.*, '\n', maxLineSize); // Dereference alloc.

    if (maybeInput) |input| {
        return input;
    } else {
        return &[_]u8{}; // Return an empty slice.
    }
}

pub fn main() !void {
    var alloc = std.heap.page_allocator;

    const name = try askName(&alloc);

    if (name.len > 0) {
        defer alloc.free(name);
        std.debug.print("Your name is: {s}\n", .{name});
    } else {
        std.debug.print("No name entered.\n", .{});
    }
}
