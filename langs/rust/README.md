# Rust

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
