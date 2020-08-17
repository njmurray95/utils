# Node

> Node.js is an open-source, cross-platform, JavaScript runtime environment that executes JavaScript code outside of a browser. Node.js lets developers use JavaScript to write command line tools and for server-side scripting—running scripts server-side to produce dynamic web page content before the page is sent to the user's web browser. Consequently, Node.js represents a "JavaScript everywhere" paradigm, unifying web-application development around a single programming language, rather than different languages for server- and client-side scripts. 

> -- Wikipedia: https://en.wikipedia.org/wiki/Node.js

Node docs: https://nodejs.org/en/docs/

Because JavaScript was not designed to compile into anything, but runs directly on the browser, it has always been intensely bound-up with the environment in which it is run. This prevented JavaScript from being used as a more traditional language for standard scripting or back-end needs. The release of Node in 2009 changed this by giving JavaScript a server-side CLI-like runtime.

More than this, node has become an integral part of the JavaScript ecosystem through its back-end package management. The Node Package Manager forms a crucial part of most modern JavaScript projects.

## Install

Official Download page: https://nodejs.org/en/download/

Node has still not fully implemented the most recent JavaScript standard, so it is usually worthwhile to grab the most recent stable build.

## Files:

* `package.json`: A JSON file describing the metadata of the JS project -- name, version number, dependencies, etc. The convention of using this file through node has spread through the JS ecosystem to many other tools and modules.
* `package-lock.json`: A JSON file describing the exact dependency tree of JS modules in the project.
* `node_modules/`: A local check-in and cache of module code required by the node project
