# Wrapper so `zig cc` can stand in for cl.exe/gcc when building treesitter parsers.
# The cc crate (used by `tree-sitter build`) passes --target=x86_64-pc-windows-msvc,
# which zig rejects ("pc" vendor part); drop it and pick a zig-native target instead.
$passthrough = $args | Where-Object { $_ -notlike '--target=*' }
& zig cc -target x86_64-windows-gnu @passthrough
exit $LASTEXITCODE
