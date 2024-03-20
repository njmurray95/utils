# Rust

[The Rust Programming Language](https://doc.rust-lang.org/book/)
[Rust By Example](https://doc.rust-lang.org/rust-by-example/)
[Rust Performance Book](https://nnethercote.github.io/perf-book/)

[Making Python 100 times faster with Rust](https://ohadravid.github.io/posts/2023-03-rusty-python/)

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

## Cargo

```
cargo new
cargo build [--release]
# Build and run
cargo run
# Status
cargo check
```

Run a test case without suppressing output:

```
cargo test -- --nocapture
```

This allows you to show stdout from a test-case that is normally suppressed:
```
println!("{:#?}", value);
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
