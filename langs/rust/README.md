# Rust

[The Rust Programming Language](https://doc.rust-lang.org/book/)
[Rust By Example](https://doc.rust-lang.org/rust-by-example/)

## Hello World

```
rustc hello.rs
./hello
```

## Misc.

Rustup has a config file in:
```
${RUSTUP_HOME}/settings.toml
```

List the current architecture that rust will attempt to build for (by default):
```
rustc -vV | sed -n 's|host: ||p'
```
