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

/// Returns the number of digits of an integer number.
pub fn numDigits(num: usize) usize {
    var count: usize = 0;
    if (num == 0) {
        return 1;
    }
    if (num != 0) {
        var temp = num;
        while (temp > 0) : (count += 1) {
            temp /= 10;
        }
    }
    return count;
}

/// Modifies a dynamic array (passing the array by reference) appending the digits of an integer number.
pub fn appendDigits(num: usize, list: *std.ArrayList(usize)) !void {
    var temp = num;
    while (temp > 0) : (temp /= 10) {
        const prev = temp % 10;
        try list.append(prev);
    }
}

/// Returns true or false if a number is an Armstrong number, respectively.
pub fn isArmstrongNumber(num: usize, list: std.ArrayList(usize)) bool {
    const numberDigits = numDigits(num);
    var sum: usize = 0;

    for (list.items) |i| {
        const prev = std.math.pow(usize, i, numberDigits);
        sum += prev;
    }

    if (sum == num) {
        return true;
    } else {
        return false;
    }
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var digits = std.ArrayList(usize).init(allocator);
    defer digits.deinit();

    const num = 154;

    try appendDigits(num, &digits);

    const res = isArmstrongNumber(num, digits);
    std.debug.print("{}\n", .{res});
}
