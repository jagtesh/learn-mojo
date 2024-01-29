from useful import tprint


@register_passable("trivial")
struct div_t:
    var quot: Int32
    var rem: Int32


fn clib_div(numer: Int32, denom: Int32) -> div_t:
    return external_call["div", div_t, Int32, Int32](numer, denom)


fn c_atof(s: StringRef) -> Float64:
    return external_call["atof", Float64, Pointer[Int8]](s.data._as_scalar_pointer())


def main():
    let float_str = StringRef("1.234")
    let val = c_atof(float_str)
    print("The parsed Float64 value is: ", val)

    let res = clib_div(17, 4)

    # should print (4, 1)
    # print("quotient, remainder: (" + str(res.quot) + ", " + str(res.rem) + ")")
    tprint("quotient, remainder: ({}, {})", str(res.quot), str(res.rem))
