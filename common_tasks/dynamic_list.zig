const std = @import("std");

pub fn main() !void {
    const alloc = std.heap.page_allocator;
    var list = std.ArrayList(usize).init(alloc);
    defer list.deinit();

    for (1..11) |value| {
        try list.append(value);
    }

    std.debug.print("Appended values: {any}\n", .{list.items});
    std.debug.print("List length: {}\n", .{list.items.len});
}
