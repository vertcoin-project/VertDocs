# VertDocs

Documentation for Vertcoin.

## Primer to Contribution

If you already have contributed to a project before, then you can skip this part.

### Getting Started
- Create your own Github account if you don't already have one

### Forking the Documentation
- Click the fork button near the top right of the screen

### Getting the Docs on Your Machine
- This is a process called "cloning". The following command clones an exact copy of the repository to your machine. Open up a terminal and type (or copy and paste)

```
git clone git@github.com:username/VertDocs.git
```

### Keeping the Fork Updated
- You cloned the fork. However, this doesn't mean it always be up to date since changes will happen to the original. To keep up to date, you will need to add a remote to your local repository. We will call it "upstream". Use the command below:

```
git remote add upstream https://github.com/vertcoin-project/VertDocs.git
```

- You can use below command to check if usptream was added correctly:

```
git remote -v
```

### Updating Your Fork
- Changes have happened to the original and you want to keep up. Use below command:

```
git fetch upstream
```

- Now that the changes have been fetch, you need to checkout your branch (which will likely be called master)

```
git checkout master
```

### Making Your Own Changes
- Adhering by good principles, you'll want to create a branch of the change you want to create. So, for exmaple, if you're going to add some documentation on Merkle trees, name the branch as such. See below commands. The first one is to guarantee you're on your master branch. You want to branch off this. The second one creates a new branch. The third one checks out the new branch so you can do work on it.

```
git checkout master

git branch merkle-trees

git checkout merkle-trees
```

- Alternatively, you can use below command to combine the second and third commands above

```
git checkout -b merkle-trees
```

### Submitting Your Changes
- You will want to make sure you have an updated fork to avoid merge conflicts. So, see the "Updating Your Fork" section. If there are any conflicts, use the following two commands:

```
git checkout merkle-trees

git rebase master
```

- Above guarantees a better time when trying to merge
- Push your changes to your working branch with below command:

```
git push origin merkle-trees
```

- Finally you'll see the changes reflected in your repository. Select the working branch then click the pull request button. Welcome to your first pull request!

## Installation

VertDocs is built with [MkDocs]. In order to install MkDocs you will need [Python] installed on your system, as well as the Python package manager, [pip]. You can check if you have these already installed from the command line:

```bash
$ python --version
# Python 2.7.13
$ pip --version
# pip 9.0.1
```

MkDocs supports Python versions 2.6, 2.7, 3.3, 3.4 and 3.5.

On Windows it is recommended that you install Python and pip with [Chocolatey].

#### Installing pip

If you're using a recent version of Python, the Python package manager, [pip](http://pip.readthedocs.io/en/stable/installing/), is most likely installed by default. However, you may need to upgrade pip to the lasted version:

```bash
$ pip install --upgrade pip
```

If you need to install [pip](http://pip.readthedocs.io/en/stable/installing/) for the first time, download [get-pip.py](https://bootstrap.pypa.io/get-pip.py). Then run the following command to install it:

```bash
$ python get-pip.py
```

#### Installing MkDocs

Install the `mkdocs` package using pip:

```pip install mkdocs```

#### Installing Theme
Install VertDocs theme (material) using pip:

```pip install mkdocs-material```

#### Installing Pymdown Extentions

Install `pymdown-extensions` using pip:

```pip install pymdown-extensions```

You should now have the `mkdocs` command installed on your system. Run ```mkdocs --version``` to check that everything worked okay.

```$ mkdocs --version
$ mkdocs --version
mkdocs, version 0.15.3
```

## Getting started

Getting started is super easy.

```bash
$ cd vertdocs
```

There is a single configuration file named `mkdocs.yml`, and a folder named `docs` that will contain the documentation source files. MkDocs comes with a built-in dev-server that lets you preview the documentation as you work on it. Make sure you are in the same directory as the `mkdocs.yml` configuration file, and then start the server by running the `mkdocs serve` command:

```bash
$ mkdocs serve
INFO    -  Building documentation...
INFO    -  Cleaning site directory
[I 160402 15:50:43 server:271] Serving on http://127.0.0.1:8000
[I 160402 15:50:43 handlers:58] Start watching changes
[I 160402 15:50:43 handlers:60] Start detecting changes
```

Open up <http://127.0.0.1:8000> in your browser, and you will see the default home page being displayed. The dev-server also supports auto-reloading, and will rebuild your documentation whenever anything in the configuration file, documentation directory, or theme directory changes.

## Building the site

To deploy dcrdocs, first build the documentation:

```bash
$ mkdocs build
```

This will create a new directory, named `site`. After some time, files may be removed from the documentation but they will still reside in the `site` directory. To remove those stale files, just run `mkdocs` with the `--clean` switch.

```bash
$ mkdocs build --clean
```

To view a list of options available on a given command, use the `--help` flag with that command. For example, to get a list of all options available for the `build` command run the following:

```bash
$ mkdocs build --help
```





## WIP

## To Do List
- [] P2Pool Overview
- [] Update Getting Started
- [] Update How to Buy Vertcoin
- [] Update Contributions
