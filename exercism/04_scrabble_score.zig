//
// Scrabble is a word game where players place letter tiles on a board to form words. Each letter has a value. A
// word's score is the sum of its letters' values.
//
// Instructions
// Your task is to compute a word's Scrabble score by summing the values of its letters.
//
// The letters are valued as follows:
//
// Letter	                    Value
// A, E, I, O, U, L, N, R, S, T	    1
// D, G	                            2
// B, C, M, P	                    3
// F, H, V, W, Y	            4
// K	                            5
// J, X	                            8
// Q, Z	                            10
//
// For example, the word "cabbage" is worth 14 points:
//
// 3 points for C
// 1 point for A
// 3 points for B
// 3 points for B
// 1 point for A
// 2 points for G
// 1 point for E

const std = @import("std");
const testing = std.testing;

pub fn CharInString(ch: u8, str: []const u8) bool {
    for (str) |i| {
        if (i == ch) {
            return true;
        }
    }
    return false;
}

pub fn getLetterValue(ch: u8) u8 {
    const onePointLetter = "AEIOULNRST";
    const twoPointLetter = "DG";
    const threePointLetter = "BCMP";
    const fourPointLetter = "FHVWY";
    const fivePointLetter = "K";
    const eightPointLetter = "JX";
    const tenPointLetter = "QZ";

    if (CharInString(ch, onePointLetter)) return 1;
    if (CharInString(ch, twoPointLetter)) return 2;
    if (CharInString(ch, threePointLetter)) return 3;
    if (CharInString(ch, fourPointLetter)) return 4;
    if (CharInString(ch, fivePointLetter)) return 5;
    if (CharInString(ch, eightPointLetter)) return 8;
    if (CharInString(ch, tenPointLetter)) return 10;

    return 0;
}

pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;

    for (s) |char| {
        const char_upper = std.ascii.toUpper(char);
        sum += getLetterValue(char_upper);
    }

    return sum;
}

pub fn main() void {
    const wordArray = [_][]const u8{
        "nestor",
        "piedad",
        "andres",
        "oscar",
        "OxyphenButazone",
    };

    std.debug.print("name, score:\n", .{});
    for (wordArray) |item| {
        const res = score(item);
        std.debug.print("{s}, {}\n", .{ item, res });
    }
}

test "lower case letter" {
    const expected: u32 = 1;
    const actual = score("a");
    try testing.expectEqual(expected, actual);
}

test "upper case letter" {
    const expected: u32 = 1;
    const actual = score("A");
    try testing.expectEqual(expected, actual);
}

test "valuable letter" {
    const expected: u32 = 4;
    const actual = score("f");
    try testing.expectEqual(expected, actual);
}

test "short word" {
    const expected: u32 = 2;
    const actual = score("at");
    try testing.expectEqual(expected, actual);
}

test "medium word" {
    const expected: u32 = 6;
    const actual = score("street");
    try testing.expectEqual(expected, actual);
}

test "long, mixed-case word" {
    const expected: u32 = 41;
    const actual = score("OxyphenButazone");
    try testing.expectEqual(expected, actual);
}

test "englis-like word" {
    const expected: u32 = 8;
    const actual = score("pinata");
    try testing.expectEqual(expected, actual);
}

test "empty input" {
    const expected: u32 = 0;
    const actual = score("");
    try testing.expectEqual(expected, actual);
}

test "entire alphabet available" {
    const expected: u32 = 87;
    const actual = score("abcdefghijklmnopqrstuvwxyz");
    try testing.expectEqual(expected, actual);
}
