
cargo-list-targets ()
{
    cargo read-manifest | jq '.targets[].name' | uniq
    # cargo read-manifest | jq '.targets | map(select(.kind == ["bin"])) | .[].name'
}
