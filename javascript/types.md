# Types

* Number
* String
* Boolean
* Symbol (ES2015)
* Object
    * Function
    * Array
    * Date
    * RegExp
* null
* undefined


## Numbers

All numbers are "double-precision 64-bit format IEEE 754 values" -- no integers. Hence:

```
> 0.1 + 0.2
0.30000000000000004
> 0.1 + 0.2 == 0.3
false
```

`NaN` ("Not a Number") is the infamous sludge value for botched math:

```
> parseInt('10')
10
> parseInt('h')
NaN
> NaN + 5
NaN
> isNaN(NaN)
true
```

JavaScript also has values for infinity:

```
> 1 / 0
Infinity
> -1 / 0
-Infinity
> Infinity + 5
Infinity
> Infinity / 6
Infinity
> isFinite(1/0)
false
```

