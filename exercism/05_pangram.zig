// Your task is to figure out if a sentence is a pangram.
//
// A pangram is a sentence using every letter of the alphabet at least once. It is case insensitive, so it doesn't
// matter if a letter is lower-case (e.g. k) or upper-case (e.g. K).
//
// The best known English pangram is:
// The quick brown fox jumps over the lazy dog.
//
// For this exercise, a sentence is a pangram if it contains each of the 26 letters in the English alphabet.

const std = @import("std");
const testing = std.testing;

pub fn charInString(ch: u8, str: []const u8) bool {
    for (str) |i| {
        if (i == ch) {
            return true;
        }
    }
    return false;
}

pub fn isPangram(str: []const u8) bool {
    const allLetters = "abcdefghijklmnopqrstuvwxyz";

    for (str) |i| {
        if (charInString(i, allLetters)) {
            return true;
        }
    }
    return false;
}

pub fn main() void {
    const arraySentence = [_][]const u8{
        "abcdefghijklmnopqrstuvwxyz",
        "oscar",
    };

    std.debug.print("Sentence, is pangram?:\n", .{});
    for (arraySentence) |i| {
        std.debug.print("{s}, {}\n", .{ i, isPangram(i) });
    }
}
