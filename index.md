# Generate Your Projects.

GYP is a Meta-Build system: a build system that generates other build systems.

Source code: https://chromium.googlesource.com/external/gyp

Mailing list:  http://groups.google.com/group/gyp-developer

Build status:
- Windows: [![Build status](https://ci.appveyor.com/api/projects/status/60c6eoat3e5lojly/branch/master?svg=true)](https://ci.appveyor.com/project/scottg/gyp/branch/master)
- Linux and Mac: [![Build status](https://travis-ci.org/chromium/gyp.svg?branch=master)](https://travis-ci.org/chromium/gyp)

GYP is intended to support large projects that need to be built on multiple
platforms (e.g., Mac, Windows, Linux), and where it is important that
the project can be built using the IDEs that are popular on each platform
as if the project is a "native" one.

It can be used to generate XCode projects, Visual Studio projects, Ninja
build files, and Makefiles. In each case GYP's goal is to replicate as
closely as possible the way one would set up a native build of the project
using the IDE.

GYP can also be used to generate "hybrid" projects that provide the IDE
scaffolding for a nice user experience but call out to Ninja to do the actual
building (which is usually much faster than the native build systems of the
IDEs).

For more information on GYP, click on the links above.
