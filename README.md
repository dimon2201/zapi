# ZAPI
Extrelemy fast LZ77 compression

Extremely fast data compression algorithm which
also achieves rather good compression ratio.

# Benchmark
enwik8 compression benchmark

| Compressor | Speed    | Compressed size | Ratio  |
|------------|----------|-----------------|--------|
| XLZ1       | 129 MB/s | 47 860 611      | 2,0894 |
| Shrinker   | 127 MB/s | 51 657 466      | 1,9358 |
| FastLZ     | 122 MB/s | 54 223 908      | 1,8442 |
| LZ4        | 119 MB/s | 57 066 747      | 1,7523 |
| LZJB2010   | 115 MB/s | 68 721 529      | 1,4551 |

# License
The ISC License

Copyright (c) 2019-2022, Dmitry Sirachenko

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
