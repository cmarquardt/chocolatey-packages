# Chocolatey Packages

~~~
<!-- EDIT ME-->

[![](https://ci.appveyor.com/api/projects/status/github/YOUR_GITHUB_USERNAME_HERE/chocolatey-packages?svg=true)](https://ci.appveyor.com/project/YOUR_GITHUB_USERNAME_HERE/chocolatey-packages)
[Update status](https://gist.github.com/YOUR_GITHUB_USERNAME_HERE/YOUR_GIST_ID)

<!-- REMOVE THE squiggles "~" surrounding this (this should not be a code block) -->
~~~

## Chocolatey Packages Template

This contains Chocolatey packages, both manually and automatically maintained.

You can choose to use one or both of the different methods currently supported in the Chocolatey community for automatic packaging. The preferred one is AU (Automatic Updater).

### Folder Structure

* automatic - where automatic packaging and packages are kept. These are packages that are automatically maintained using [AU](https://chocolatey.org/packages/au).
* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* manual - where packages that are not automatic are kept.
* setup - items for prepping the system to ensure for auto packaging.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)

#### AU

* PowerShell v5+.
* The [AU module](https://chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).

### Getting started

1. Fork this repository and rename it to `chocolatey-packages` (on GitHub - go into Settings, Repository name and rename).
1. Clone the repository locally.
1. Head into the `setup` folder and perform the proper steps for your choice of setup (or both if you plan to use both methods).
1. Edit this README. Update the badges at the top.
