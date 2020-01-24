# XLZ
Extrelemy fast LZ77 compression

Extremely fast data compression algorithm which
also achieves rather good compression ratio.
Written in pure C for portability.

# Benchmark
enwik8 compression benchmark
| Compressor | Speed    | Compressed size | Ratio  |
|------------|----------|-----------------|--------|
| XLZ1       | 129 MB/s | 47 860 611      | 2,0894 |
| LZ4        | 119 MB/s | 57 066 747      | 1,7523 |
| Shrinker   | 127 MB/s | 51 657 466      | 1,9358 |
| FastLZ     | 122 MB/s | 54 223 908      | 1,8442 |
| LZJB2010   | 115 MB/s | 68 721 529      | 1,4551 |

# License
The MIT License (MIT)

Copyright © 2019-20. Banebyte

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
