// Find the difference between the square of the sum and the sum of the squares of the first N natural numbers.
//
// The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)² = 55² = 3025.
//
// The sum of the squares of the first ten natural numbers is 1² + 2² + ... + 10² = 385.
//
// Hence the difference between the square of the sum of the first ten natural numbers and the sum of the squares of
// the first ten natural numbers is 3025 - 385 = 2640.
//
// You are not expected to discover an efficient solution to this yourself from first principles; research is allowed,
// indeed, encouraged. Finding the best algorithm for the problem is a key skill in software engineering.

const std = @import("std");
const testing = std.testing;

pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;

    for (0..number + 1) |i| {
        sum += i;
    }
    return std.math.pow(usize, sum, 2);
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;

    for (0..number + 1) |i| {
        sum += std.math.pow(usize, i, 2);
    }
    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}

pub fn main() void {
    const res = squareOfSum(10);
    std.debug.print("Square of sum: {}\n", .{res});

    const res1 = sumOfSquares(10);
    std.debug.print("Sum of squares: {}\n", .{res1});

    const res2 = differenceOfSquares(10);
    std.debug.print("Difference: {}\n", .{res2});
}

test "square of sum up to 1" {
    const expected: usize = 1;
    const actual = squareOfSum(1);
    try testing.expectEqual(expected, actual);
}

test "square of sum up to 5" {
    const expected: usize = 225;
    const actual = squareOfSum(5);
    try testing.expectEqual(expected, actual);
}

test "sum of squares up to 1" {
    const expected: usize = 1;
    const actual = sumOfSquares(1);
    try testing.expectEqual(expected, actual);
}

test "sum of squares up to 5" {
    const expected: usize = 55;
    const actual = sumOfSquares(5);
    try testing.expectEqual(expected, actual);
}

test "difference of squares up to 1" {
    const expected: usize = 0;
    const actual = differenceOfSquares(1);
    try testing.expectEqual(expected, actual);
}

test "difference of squares up to 5" {
    const expected: usize = 170;
    const actual = differenceOfSquares(5);
    try testing.expectEqual(expected, actual);
}
