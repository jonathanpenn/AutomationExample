# Copyright (c) 2012 Jonathan Penn (http://cocoamanifest.net/)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Make sure bash fails completely if any command fails
set -e

BUILD_DIR=/tmp/AutomationExample

mkdir -p $BUILD_DIR

xcodebuild -sdk iphonesimulator build CONFIGURATION_BUILD_DIR=$BUILD_DIR

rm -rf automation_results
mkdir -p automation_results

# Read the comments in the "unix_instruments" script for why we need it

./unix_instruments \
  -D automation_results/trace \
  -t UIAutomationTemplate.tracetemplate \
  $BUILD_DIR/AutomationExample.app \
  -e UIARESULTSPATH automation_results \
  -e UIASCRIPT automation_script.js

echo "Tests passed!"

