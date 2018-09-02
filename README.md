# Setup your programming environment with iTerm2

This package lets you open multiple terminal tabs all at once and
execute commands to quickly bring up your programming environment for a
specific project.

## Quickstart

```
# Install the package

ln -s `pwd`/startenv /usr/local/bin/startenv # if using Homebrew
sudo ln -s `pwd`/startenv /usr/bin/startenv # otherwise

# Creating your first environment

startenv init hello

# ...edit ~/.startenv/hello.js

startenv hello
```

## Description

When working with Web projects you often end up using multiple building
tools that need to run in the background. For example, `npm run watch`
for your Webpack asset building or starting a development server with
either PHP, Django, Ruby or any other framework of your choice.

It can be very cumbersome to switch between two projects. On the other
hand, creating multiple profiles for each particular command leaves us
with a very full iTerm profile pane. This package addresses this problem
by managing iTerm via Apple Javascript for Automation.

Simply define such file in your `~/.startenv/myenv.js`:

```
ALLTERMS = [
    'nvm use 9',
]

TERMS = [
    [title("hello world"), 'git status'],
    'php -S localhost:8000 -t public/',
    'npm run watch',
]

PATH = '/Users/MYUSERNAME/some/path/to/project'
```

and type `startenv myenv`. It will tell iTerm to open three new tabs.
Each one will:

- [x] open the `PATH` directory, 
- [x] execute all lines `ALLTERMS` as terminal commands,
- [x] execute a line in `TERMS` in each terminal tab (multiple commands if array is passed),
- [x] switch back to the first tab.

You can also choose a specific iTerm profile with `PROFILE` and name
your terms with the `title()` function.

## Examples

- [Example with comments](examples/fullexample.js)
- [Django+webpack starter](examples/django+webpack.js)

## TODO

- [ ] Expand user name in PATH.
- [ ] Add package to Homebrew repositories to make installation simple.
- [ ] Add more examples.

<!-- vim: set tw=72: -->
