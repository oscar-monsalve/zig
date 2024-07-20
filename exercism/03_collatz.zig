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

const std = @import("std");
const testing = std.testing;

// Please implement the `ComputationError.IllegalArgument` error.

pub fn steps(number: usize) anyerror!usize {
    _ = number;
    @compileError("please implement the steps function");
}

pub fn main() !void {}
