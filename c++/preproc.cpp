// CPP Preprocessor is turing-complete and can write its own programs

// A """print""" method that will always fire
template <long long N>
struct report {
    static_assert(N && false, "report");
};

// Factorial implementation
template <int N>
struct factorial {
    static const long long value = N * factorial<N - 1>::value;
};
template <>
struct factorial<0> {
    static const long long value = 1;
};

// Fibonacci implementation
template <int N>
struct fib {
    static const long long value = fib<N - 1>::value + fib<N - 2>::value;
};
template <>
struct fib<0> {
    static const long long value = 0;
};
template <>
struct fib<1> {
    static const long long value = 1;
};

// Variable declaration
#ifndef NUM
#define NUM 5
#endif

// Printing
report<factorial<NUM>::value> a;
report<fib<NUM>::value> b;
