use std::path::Path;

pub fn print_type_of<T>(_: &T) -> () {
    println!("{}", std::any::type_name::<T>())
}

pub fn running_in_docker() -> bool {
    Path::new("/.dockerenv").exists()
}
