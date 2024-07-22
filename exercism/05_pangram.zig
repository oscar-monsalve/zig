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

pub fn isPangram(str: []const u8) bool {
    var seen = [_]bool{false} ** 26; // Array of bools to track seen letters

    for (str) |ch| {
        if (ch >= 'a' and ch <= 'z') {
            seen[ch - 'a'] = true; // Mark the letter as seen
        } else if (ch >= 'A' and ch <= 'Z') {
            seen[ch - 'A'] = true; // Handle uppercase letters
        }
    }

    for (seen) |letter_seen| {
        if (!letter_seen) {
            return false;
        }
    }
    return true;
}

pub fn main() void {
    const arraySentence = [_][]const u8{
        "abcdefghijklmnopqrstuvwxyz",
        "oscar",
        "",
        "The quick brown fox jumps over the lazy dog", // has all letters
        "a quick movement of the enemy will jeopardize five gunboats", // does not have 'x'
    };

    std.debug.print("Sentence, is pangram?:\n", .{});
    for (arraySentence) |i| {
        std.debug.print("{s}, {}\n", .{ i, isPangram(i) });
    }
}

test "empty sentence" {
    try testing.expect(!isPangram(""));
}

test "perfect lower case" {
    try testing.expect(isPangram("abcdefghijklmnopqrstuvwxyz"));
}

test "only lower case" {
    try testing.expect(isPangram("The quick brown fox jumps over the lazy dog"));
}

test "missing the letter 'x'" {
    try testing.expect(!isPangram("a quick movement of the enemy will jeopardize five gunboats"));
}

test "missing the letter 'h'" {
    try testing.expect(!isPangram("five boxing wizards jump quickly at it"));
}

test "with underscores" {
    try testing.expect(isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"));
}

test "with numbers" {
    try testing.expect(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"));
}

test "missing letters replaced by numbers" {
    try testing.expect(!isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));
}

test "mixed case and punctuation" {
    try testing.expect(isPangram("\"Five quacking Zephyrs jolt my wax bed.\""));
}

test "a-m and A-M are 26 different characters but not a pangram" {
    try testing.expect(!isPangram("abcdefghijklm ABCDEFGHIJKLM"));
}

test "non-alphanumeric printable ASCII" {
    try testing.expect(!isPangram(" !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"));
}
