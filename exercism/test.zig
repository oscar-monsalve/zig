const std = @import("std");

pub fn main() void {
    const letters = "abcdefghijklmnopqrstuvwxyz";
    for (letters) |i| {
        const res = i - 'a';
        std.debug.print("{}\n", .{res});
    }

    //std.debug.print("{}\n", .{res});

    // const seen = [_]bool{false} ** 26;
    // std.debug.print("{}\n", .{@TypeOf(seen)});
}
