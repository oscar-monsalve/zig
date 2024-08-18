const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();

    std.debug.print("Input your name:\n", .{});

    const alloc: std.mem.Allocator = std.heap.page_allocator;
    const maxLineSize = 1024;
    const maybeInput = try stdin.readUntilDelimiterOrEofAlloc(alloc, '\n', maxLineSize);

    if (maybeInput) |input| {
        defer alloc.free(input);
        std.debug.print("You entered: {s}\n", .{input});
    }
}
