# Setup your programming environment with iTerm2

This package lets you open multiple terminal tabs all at once and
execute commands to quickly bring up your programming environment for a
specific project.

## Quickstart

```bash
# Install the package

git clone https://github.com/dragonee/iterm2-startenv.git
cd iterm2-startenv

ln -s `pwd`/startenv /usr/local/bin/startenv # if using Homebrew
sudo ln -s `pwd`/startenv /usr/bin/startenv # otherwise

# Creating your first environment

cd /Path/to/project/hello

startenv init

# ...edit .startenv.js

startenv
```

## Description

When working with Web projects you often end up using multiple building
tools that need to run in the background. For example, `npm run watch`
for your Webpack asset building or starting a development server with
either PHP, Django, Ruby or any other framework of your choice.

It can be very cumbersome to switch between multiple projects, which
happens fairly often if you are reviewing pull requests in several
projects at once. You could try creating multiple profiles 
for each particular command but that approach will leave you with a
bunch of profiles for every project you are in and your iTerm profile
panel will fill up very quickly. This package addresses this problem
by managing iTerm via Apple Javascript for Automation.

Simply go to your project directory (for now let's assume it's named `hello`) 
and `startenv init`. Edit the `.startenv.js` file to:

```javascript
ALLTERMS = [
    'nvm use 10',
]

TERMS = [
    [title("hello world"), 'git status'],
    'php -S localhost:8000 -t public/',
    'npm run watch',
]
```

and type `startenv`. It will tell iTerm to open three new tabs. Each of
them will:

- [x] open this directory, 
- [x] execute all lines `ALLTERMS` as terminal commands,
- [x] execute a line in `TERMS` in each terminal tab (multiple commands if array is passed),

You can also choose a specific iTerm profile with `PROFILE` and name
your terms with the `title()` function.

What's more, all your `startenv`ed projects are symlinked in
`~/.startenv`, so you can run the command from any directory whatsoever:

```
dragonee@lain ~ $ startenv hello
```

The above command will still open three terminal tabs in your project
directory.

## Usage

### `startenv init [NAME]`

Run in project root directory. It will create a `.startenv.js` file for
you that you need to configure and create a symlink for your
convenience. The name of this symlink can be specified with NAME
argument, by default it's the name of the root directory.

### `startenv list`

List currently symlinked (used) projects that you can start with
`startenv NAME`

### `startenv NAME`

Open a number of terminal tabs with configurable commands. 

### `startenv`

If run in project directory it will look upwards (like Git) for a file
named `.startenv.js`. If it exists, it will run it and open a number of
terminal tabs with configurable commands.

If run outside of project directory, it prints out output of `startenv list`.

## Examples

- [Example with comments](examples/fullexample.js)
- [Django+webpack starter](examples/django+webpack.js)

## TODO

- [ ] Add package to Homebrew repositories to make installation simple.
- [ ] Add more examples.

<!-- vim: set tw=72: -->
