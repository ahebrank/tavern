#!/usr/bin/env sh

bazel run //:gazelle_python_manifest.update
bazel run //:gazelle
bazel run --run_under "cd $PWD && " @bazel_buildtools//buildozer \
  'substitute deps @tavern_pip//pypi__([^/]+) @tavern_pip_${1}//:pkg' //...:*
