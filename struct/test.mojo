from sys import ffi


@value
struct Point:
    var x: Int
    var y: Int


fn add_coords(p: Point) -> Int:
    let handle = ffi.DLHandle("testlib.dylib")
    let sum = handle.get_function[fn (p: Point) -> Int]("add_coords")
    return sum(p)


def main():
    var p = Point(1, 2)
    var val = add_coords(p)
    print("The parsed result value is: ", val)
