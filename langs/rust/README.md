# Rust

[Rust Performance Book](https://nnethercote.github.io/perf-book/)

[Making Python 100 times faster with Rust](https://ohadravid.github.io/posts/2023-03-rusty-python/)

## Cargo

```
cargo new
cargo build [--release]
# Build and run
cargo run
# Status
cargo check
```

## Hello World

```
rustc hello.rs
./hello
```

Or:
```
cargo new <proj>
cd <proj>
cargo run
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

### Macros

Stub a function for later:

```
fn do_nothing() -> Result<i32, Box<dyn Error>> {
    todo!();
}
```
