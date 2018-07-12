# brotli CLI tool

brotli CLI tool v1.0.5 for compression (or decompression) files. Compiled from [official sources](https://github.com/google/brotli/tree/master/c/tools) as a static executable for using on some embedded devices. Tested on Alpine Linux 3.8

See **[Releases](https://github.com/Vimux/brotli-cli/releases)** for binaries.

## OPTIONS

* `-#`:
    compression level (0-9); bigger values cause denser, but slower compression
* `-c`, `--stdout`:
    write on standard output
* `-d`, `--decompress`:
    decompress mode
* `-f`, `--force`:
    force output file overwrite
* `-h`, `--help`:
    display this help and exit
* `-j`, `--rm`:
    remove source file(s); `gzip (1)`-like behaviour
* `-k`, `--keep`:
    keep source file(s); `zstd (1)`-like behaviour
* `-n`, `--no-copy-stat`:
    do not copy source file(s) attributes
* `-o FILE`, `--output=FILE`
    output file; valid only if there is a single input entry
* `-q NUM`, `--quality=NUM`:
    compression level (0-11); bigger values cause denser, but slower compression
* `-t`, `--test`:
    test file integrity mode
* `-v`, `--verbose`:
    increase output verbosity
* `-w NUM`, `--lgwin=NUM`:
    set LZ77 window size (0, 10-24) (default: 22); window size is
    `(2**NUM - 16)`; 0 lets compressor decide over the optimal value; bigger
    windows size improve density; decoder might require up to window size
    memory to operate
* `-S SUF`, `--suffix=SUF`:
    output file suffix (default: `.br`)
* `-V`, `--version`:
    display version and exit
* `-Z`, `--best`:
    use best compression level (default); same as "`-q 11`"

## Related links

[brotli official repository](https://github.com/google/brotli)

brotli is open-sourced under the [MIT License](https://opensource.org/licenses/MIT).