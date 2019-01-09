# gits

**Run Git commands on several repositories at once.**

This is a work in progress; currently, it can only update several repositories
using `git pull`.

## Use cases

- Update all Git repositories contained in a directory (with one level of recursion).

## Installation

### Binary releases

Download a binary for your operating system on the
[Releases page](https://github.com/Calinou/gits/releases).
Make sure to place it in a location present in your `PATH` environment variable.

### Building from source

After installing [Nim](https://nim-lang.org/)
and [Nimble](https://github.com/nim-lang/nimble) (bundled with Nim),
enter the following command in a terminal:

```text
nimble install https://github.com/Calinou/gits
```

Using this installation method, gits will be immediately available in your `PATH`.

## Usage

Type the following command in any directory containing Git repositories:

```text
gits
```

Note that password prompts (if any) will cause the program to hang;
it can be interrupted by pressing <kbd>Ctrl + C</kbd>.
Consider using an authentication method that does not require a password prompt,
such as SSH with ssh-agent.

## License

Copyright © 2018 Hugo Locurcio and contributors

Unless otherwise specified, files in this repository are licensed under
the MIT license; see [LICENSE.md](LICENSE.md) for more information.
