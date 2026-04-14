const std = @import("std");

const Person = struct {
    fist_name: []const u8,
    middle_name: ?[]const u8,  // Optional field
    age: u32
};

pub fn main() !void {

    const person_1: Person = .{
        .fist_name = "Oscar",
        .middle_name = "Dario",
        .age = 28
    };

    const person_2: Person = .{
        .fist_name = "Andres",
        .middle_name = null,
        .age = 25
    };

    print_person(person_1);

    print_person(person_2);

}

fn print_person(person: Person) void {
    std.debug.print("Name: {s}\n", .{person.fist_name});

    if (person.middle_name) |middle_name| {
        std.debug.print("Middle name: {s}\n", .{middle_name});
    }

    std.debug.print("Age: {d}\n", .{person.age});
}
