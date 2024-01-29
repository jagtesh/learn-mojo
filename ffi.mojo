from sys import ffi

alias c_atof_type = fn (s: DTypePointer[SIMD[Int8, 1]]) -> Float64


def main():
    let handle = ffi.DLHandle("")
    let c_atof = handle.get_function[c_atof_type]("atof")

    let float_str = StringRef("1.234")
    let val = c_atof(float_str._as_ptr())
    print("The parsed Float64 value is: ", val)
