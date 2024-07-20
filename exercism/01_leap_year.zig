// A leap year (in the Gregorian calendar) occurs:
//
// In every year that is evenly divisible by 4.
// Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly
// divisible by 400.
// Some examples:
//
// 1997 was not a leap year as it's not divisible by 4.
// 1900 was not a leap year as it's not divisible by 400.
// 2000 was a leap year!

const std = @import("std");
const testing = std.testing;

pub fn isLeapYear(year: u32) bool {
    if (year % 100 == 0) {
        if (year % 400 == 0) {
            return true;
        } else {
            return false;
        }
    }
    if (year % 4 == 0) {
        return true;
    } else {
        return false;
    }
}

pub fn main() !void {}

test "year not divisible by 4" {
    try testing.expect(!isLeapYear(2015));
}

test "year divisible by 2, not divisible by 4" {
    try testing.expect(!isLeapYear(1970));
}

test "year divisible by 4, not divisible by 100 in leap year" {
    try testing.expect(isLeapYear(1996));
}

test "year divisible by 100, not divisible by 400" {
    try testing.expect(!isLeapYear(2100));
}
