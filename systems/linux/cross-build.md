# Running binaries across different distros

Running a binary compiled on one distro on another distro. Either this works by defualt, or it doesn't. In that case, this has only worked for me ever exactly once, but it's worth documenting how.

1. Use `ldd`

First, invoke the binary on the with the `ldd` command, which will check for all the DLL / .so files it is trying to load:

```
ldd ./qdrant 
./qdrant: /lib64/libm.so.6: version `GLIBC_2.29' not found (required by ./qdrant)
./qdrant: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.26' not found (required by ./qdrant)
[...]
	linux-vdso.so.1 (0x00007ffe58fe4000)
	libstdc++.so.6 => /lib64/libstdc++.so.6 (0x00007f3faeb3e000)
	libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f3fae926000)
	[...]
```

2. Copy files over

The binary is trying to load such-and-such files at runtime. Copy them from the machine on which the binary works, over to the machine on which they don't:

(Running `ldconfig` in the original machine may be helpful for finding the actual locations of the files if they've been symlinked. Of course, there's always `find`.)

If mounted machines:
```
mkdir -p /copy/path/to/lib
cp /orig/lib64/libstdc++.so.6 /copy/path/to/lib/
```

If in Docker:
```
RUN mkdir -p /path/to/lib/
COPY [[--from=builder]] /lib64/libstdc++.so.6 /path/to/lib/libstdc++.so.6
```

3. Set LD_LIBRARY_PATH

Invoke the command with something like:
```
LD_LIBRARY_PATH="/qdrant/lib/" /qdrant/lib/ld-linux-x86-64.so.2 /qdrant/qdrant
```
