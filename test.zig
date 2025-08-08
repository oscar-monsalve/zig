const std = @import("std");

const Days = enum(u8) {
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY,
};

pub fn main() void {
    // const floating: f32 = 2.0;
    // const integer: i32 = 4;
    const stringer: []u8 = "Hello";

    std.debug.print("{s}", .{stringer});
}
