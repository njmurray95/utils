# Rust

## Misc.

Rustup has a config file in:
```
${RUSTUP_HOME}/settings.toml
```

List the current architecture that rust will attempt to build for (by default):
```
rustc -vV | sed -n 's|host: ||p'
```
