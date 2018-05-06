const std = @import("std");

pub fn iterator(comptime BaseType: type, comptime NewType: type, comptime ItType: type) type {
    return struct {
        nextIt: &ItType,

        const Self = this;

        pub fn count(self: &Self) i32 {
            return self.nextIt.count();
        }

        pub fn next(self: &Self) ?NewType {
            while (self.nextIt.next()) |nxt| {
                return NewType(nxt);
            }
            return null;
        }

        pub fn reset(self: &Self) void {
            self.nextIt.reset();
        }
    };
}