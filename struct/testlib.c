// Demonstrate how structs are passed in Mojo
#include <stdio.h>

struct Point
{
    int x;
    int y;
};

int add_coords(struct Point *p)
{
    return p->x + p->y;
}

int main()
{
    struct Point p;
    p.x = 1;
    p.y = 2;

    printf("Sum of coordinates: %d\n", add_coords(&p));

    return 0;
}