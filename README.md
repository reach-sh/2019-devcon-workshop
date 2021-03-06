This repository holds the materials for participants in the 2019
DevCon Workshop

[Building a Formally-Verified DApp with the Reach DSL, today!](https://devcon.org/agenda?talk=recMj704hGSTMLDVK)

The slides [are available
here](https://docs.google.com/presentation/d/e/2PACX-1vQDfYf7EI7dhFN24nBPL0M0QC5YbNjr_veUZiy-R22aqzihL_b1DirBS-KOlifAt3y46sc6XNHbM7O0/pub?start=false&loop=false&delayms=15000),
but they don't talk about the project; they're just an introduction to
the platform.

---

The workshop is based on one of the Reach examples:

https://github.com/reach-sh/reach-lang/tree/master/examples/multisig

---

The only requirement to participate is to have Docker and
`docker-compose` installed. Obviously, you'll need to have a basic
UNIX environment with `make` available, as well.

---

The repository is divided into directories for each stage of the
project you'll be working on.

- `initial` - The version that you'll start from
- `minimal` - A minimal version without interesting client behavior
- `final` - The final version of the application.

---

We recommend starting the project by first moving to the `final`
directory and running:

```
$ make clean build run
```

to ensure that all files and utilities you will need throughout the
project are available.
