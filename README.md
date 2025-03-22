# path

Utilities for working with file and directory paths, supporting the separator from the operating system.

Similar packages:

| Package | Description                                                             |
|:--------|:------------------------------------------------------------------------|
| path    | recognises the path-part separator from the operating system            |
| [upath] | recognises the `/` (slash) as the path-part separator                   |
| [wpath] | recognises the `\` (backslash) as the path-part separator               |
| [bpath] | recognises both `/` (slash) and `\` (backslash) as path-part separators |

## Synopsis

```go
import prantlf.path { dirname }

home_dir := ...   // '/home/prantlf' or r'C:\Users\prantlf'
dirname(home_dir) // returns '/home' or r'C:\Users'
```

## Installation

You can install this package either from [VPM] or from GitHub:

```txt
v install prantlf.path
v install --git https://github.com/prantlf/v-path
```

## API

The following functions are exported:

### basename(path string) string

Theis method returns the last portion of a path, similar to the [POSIX basename] command. Trailing directory separators are ignored.

```go
home_dir := ...         // '/home/prantlf' or r'C:\Users\prantlf'
path.basename(home_dir) // returns 'prantlf'
```

### dirname(path string) string

This method returns the directory name of a path, similar to the [POSIX dirname] command. Trailing directory separators are ignored.

```go
home_dir := ...        // '/home/prantlf' or r'C:\Users\prantlf'
path.dirname(home_dir) // returns '/home' or r'C:\Users'
```

### extname(path string) string

This method returns the extension of the path, from the last occurrence of the `.` (period) character to end of string in the last portion of the path. If there is no `.` in the last portion of the path, or if there are no `.` characters other than the first character of the basename of path (see `basename` above), an empty string is returned.

```go
// sets '/home/prantlf/info.txt' or r'C:\Users\prantlf\info.txt'
info_file := os.join_path_single(os.getwd(), 'info.txt')
// returns '.txt'
path.extname(info_file)
```

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Lint and test your code.

## License

Copyright (c) 2023-2025 Ferdinand Prantl

Licensed under the MIT license.

[VPM]: https://vpm.vlang.io/packages/prantlf.path
[upath]: https://github.com/prantlf/v-upath
[wpath]: https://github.com/prantlf/v-wpath
[bpath]: https://github.com/prantlf/v-bpath
[POSIX basename]: https://man7.org/linux/man-pages/man3/basename.3p.html
[POSIX dirname]: https://man7.org/linux/man-pages/man3/dirname.3p.html
