## Usage

The plugin comes with only one command, `:Diffurcate`. Open a git diff and execute the command, and it'll open a new tab in a temporary directory that contains separate diffs per file, mirroring the original directory structure. If you happen to have the NERDTree plugin installed, it'll open it as well (happy to add similar functionality for other navigation plugins, just open a github issue).

![Demo](https://user-images.githubusercontent.com/124255/137620939-909ec2bb-cca4-4167-9a04-cfa6ca04d5fe.gif)

You can do this with a file on the filesystem, or just redirect the output from a git command, for example:

``` bash
git diff | vim - -R +Diffurcate
```

At the moment, this only works on git diffs, but if you'd like to get support for other VCS diffs, it shouldn't be too hard to implement.

## Internals

The plugin uses Vim's `tempname()` function to create a temporary directory that will be deleted when Vim exits. That's where it creates each individual file. It uses regexes to figure out where the individual diffs start and end, so if it messes something up, it might be the pattern doesn't cover all the right cases -- please open a github issue and we'll figure it out.

## Contributing

Pull requests are welcome, but take a look at [CONTRIBUTING.md](https://github.com/AndrewRadev/diffurcate.vim/blob/main/CONTRIBUTING.md) first for some guidelines. Be sure to abide by the [CODE_OF_CONDUCT.md](https://github.com/AndrewRadev/diffurcate.vim/blob/master/CODE_OF_CONDUCT.md) as well.
