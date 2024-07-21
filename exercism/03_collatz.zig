// The Collatz Conjecture or 3x+1 problem can be summarized as follows:
//
// Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, multiply n by 3 and add 1 to
// get 3n + 1. Repeat the process indefinitely. The conjecture states that no matter which number you start with, you
// will always reach 1 eventually.
//
// Given a number n, return the number of steps required to reach 1.
//
// Examples
// Starting with n = 12, the steps would be as follows:
//
// 1. 12
// 2. 6
// 3. 3
// 4. 10
// 5. 5
// 6. 16
// 7. 8
// 8. 4
// 9. 2
// 10. 1
// Resulting in 9 steps. So for input n = 12, the return value would be 9.
//
//For this exercise you must add an error set ComputationError that contains the IllegalArgument error. Remember to
//make it public! The steps function must return ComputationError.IllegalArgument when its input is equal to zero.
//
// Later exercises will usually omit explicit instructions like this. In general, Exercism expects you to read the
// test file when implementing your solution.
//
// Please implement the `ComputationError.IllegalArgument` error.

const std = @import("std");
const testing = std.testing;

pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) ComputationError!usize {
    if (number == 0) {
        return ComputationError.IllegalArgument;
    }

    var sequence: usize = number;
    var index: usize = 0;

    while (sequence != 1) : (index += 1) {
        if (sequence % 2 == 0) {
            sequence = sequence / 2;
        } else {
            sequence = sequence * 3 + 1;
        }
        // std.debug.print("{}. {}\n", .{ index, sequence });
    }
    //std.debug.print("\n", .{});
    return index;
}

pub fn main() !void {
    const res = steps(12) catch |err| {
        if (err == ComputationError.IllegalArgument) {
            std.debug.print("{}\n", .{err});
            return;
        } else {
            return err;
        }
    };
    std.debug.print("{}\n", .{res});
}

test "zero steps for one" {
    const expected: usize = 0;
    const actual = try steps(1);
    try testing.expectEqual(expected, actual);
}

test "divide if even" {
    const expected: usize = 4;
    const actual = try steps(16);
    try testing.expectEqual(expected, actual);
}

test "even and odd steps" {
    const expected: usize = 9;
    const actual = try steps(12);
    try testing.expectEqual(expected, actual);
}

test "large number of even and add steps" {
    const expected: usize = 152;
    const actual = try steps(1_000_000);
    try testing.expectEqual(expected, actual);
}

test "zero is an error" {
    const expected = ComputationError.IllegalArgument;
    const actual = steps(0);
    try testing.expectError(expected, actual);
}
