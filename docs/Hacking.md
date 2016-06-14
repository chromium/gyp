# Hacking

[TOC]

Note that the instructions below assume that you have the Chromium
[depot tools](http://dev.chromium.org/developers/how-tos/depottools)
installed and configured.
If you don't, you do not pass go, and you cannot collect your $200.

## Getting the sources

Git is required to hack on anything, you can set up a git clone of GYP
as follows (assuming depot\_tools is in your path):

```
mkdir foo
cd foo
fetch gyp
cd gyp
```

(this will create foo/.gclient and clone gyp underneath it into `foo/gyp`.
`foo` can be any directory name you want. Once you've done that,
you can use the repo like anything other Git repo.

(Technically you can skip fetch and just do
`git clone https://chromium.googlesource.com/external/gyp.git`,
but `fetch gyp` is shorter).

## Testing your change

GYP has a suite of tests which you can run with the provided test driver
to make sure your changes aren't breaking anything important.

You run the test driver with e.g.

```
python gyptest.py
python gyptest.py test/win  # Only run Windows-related tests.
python gyptest.py -a -f ninja  # Only run ninja-related tests.
```

See [Testing](Testing.md) for more details on the test framework.

Note that it can be handy to look at the project files output by the tests
to diagnose problems. The easiest way to do that is by kindly asking the
test driver to leave the temporary directories it creates in-place.
This is done by setting the enviroment variable "PRESERVE", e.g.

```
set PRESERVE=all     # On Windows
export PRESERVE=all  # On saner platforms.
```

## Reviewing your change

All changes to GYP must be code reviewed before submission, GYP uses rietveld.

Upload your change with:

```
git cl upload
```

## Try jobs

Once you're ready to submit, you can use the GYP try bots to test your change
with e.g.

```
git cl try
```

*Trying to use the Rietveld UI to run try jobs is currently broken*.


## Submitting

Once the change has been approved (LGTMed) and passes trybots, you can submit
it with:

```
git cl land
```

To be allowed to submit, you will need committer rights in the project. You
need to do the new password dance at
https://chromium.googlesource.com/new-password .

*There currently is no commit queue for GYP, so the commit queue boxes in
the Rietveld UI don't work either.*

## Watch the tree!

Gyp's Buildbot status page can be found here:
http://build.chromium.org/p/client.gyp/

On that page you can view both the try job results from builds and the
continuous results from landed commits.
