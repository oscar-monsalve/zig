// An Armstrong number is a number that is the count of its own digits each raised to the power of the number of
// digits.
//
// For example:
//
//     9 is an Armstrong number, because 9 = 9^1 = 9
//     10 is not an Armstrong number, because 10 != 1^2 + 0^2 = 1
//     153 is an Armstrong number, because: 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
//     154 is not an Armstrong number, because: 154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190
//
// Write some code to determine whether a number is an Armstrong number.

const std = @import("std");
const testing = std.testing;

/// Returns true or false if a number is an Armstrong number, respectively.
pub fn isArmstrongNumber(num: usize) !bool {
    // 1. Compute the number of digits
    var numberDigits: usize = 0;
    if (num == 0) {
        numberDigits = 1;
    }
    if (num != 0) {
        var temp = num;
        while (temp > 0) : (numberDigits += 1) {
            temp /= 10;
        }
    }

    // 2. Initialize a dynamic array and append to the array the digits of an integer
    const allocator = std.heap.page_allocator;
    var digits = std.ArrayList(usize).init(allocator);
    defer digits.deinit();

    var temp = num;
    while (temp > 0) : (temp /= 10) {
        const prev = temp % 10;
        try digits.append(prev);
    }

    // 3. Check for Armstrong number
    var sum: usize = 0;
    for (digits.items) |i| {
        const prev = std.math.pow(usize, i, numberDigits);
        sum += prev;
    }

    if (sum == num) {
        return true;
    } else {
        return false;
    }
}

pub fn main() void {
    const num1 = 153; // Expect true
    const num2 = 154; // Expect false
    const num3 = 0; // Expect true
    const num4 = 5; // Expect true

    const res1 = isArmstrongNumber(num1);
    const res2 = isArmstrongNumber(num2);
    const res3 = isArmstrongNumber(num3);
    const res4 = isArmstrongNumber(num4);

    std.debug.print("{any}\n{any}\n{any}\n{any}\n", .{ res1, res2, res3, res4 });
}

test "zero is an armstrong number" {
    try testing.expect(try isArmstrongNumber(0));
}
