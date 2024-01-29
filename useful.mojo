from collections import KeyElement


# Write a function that implements the functinoality of f"" strings in Python.
# The function should take a format string and a list of arguments and return
# the formatted string.
fn tprint(input_string: String, *args: String):
    var output: String = input_string
    var has_next = True

    for i in range(len(args)):
        let pos = output.find("{}")
        if pos == -1:
            break

        output = output[:pos] + args[i] + output[pos + 2 :]

    print(output)


@value
struct StringKey(KeyElement):
    var s: String

    fn __init__(inout self, owned s: String):
        self.s = s ^

    fn __init__(inout self, s: StringLiteral):
        self.s = String(s)

    fn __hash__(self) -> Int:
        let ptr = self.s._buffer.data.value
        return hash(DTypePointer[DType.int8](ptr), len(self.s))

    fn __eq__(self, other: Self) -> Bool:
        return self.s == other.s
