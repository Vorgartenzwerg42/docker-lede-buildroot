docker-lede-buildroot
========================
[![Docker Build Status](http://hubstatus.container42.com/noonien/lede-buildroot)](https://registry.hub.docker.com/u/noonien/lede-buildroot)
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/noonien/docker-lede-buildroot/blob/master/LICENSE)


This is a docker container for the 
[buildroot](http://wiki.openwrt.org/doc/howto/buildroot.exigence)
of the OpenWRT fork [Lede](https://lede-project.org/).

Because the build system requires that its command are not executed by root,
the user `lede` was created. The buildroot can be found in
`/home/lede/lede`.

Usage
-----

 - To build the container image, run

```sh
make
```

 - To make the config, you've to run a shell:

To run a shell in the buildroot, run:
```sh
make run-shell
```

And then:

```sh
make defconfig
make prereq
make menuconfig
cp .config /srv/  # save the config outside the container
```

 - To compile lede, run

```sh
make run
```

More information on how to use this buildroot can be found on the
[OpenWRT wiki](http://wiki.openwrt.org/doc/howto/build).
