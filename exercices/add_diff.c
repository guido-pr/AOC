int add(int a, int b) {
    int sum;
    sum = a + b;
    return sum;
}

int negative(int a) {
    int nega;
    nega = 0 - a;
    return nega;
}

int diff(int a, int b) {
    int negb, difference;
    negb = negative(b);
    difference = add(a, negb);
    return difference;
}

void main() {
    int a, b, c, d;
    // Suponha valores para a e b, por exemplo:
    a = 10;
    b = 3;
    c = add(a, b);
    d = diff(a, b);
}
