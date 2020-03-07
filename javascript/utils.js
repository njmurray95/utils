const cp = require('child_process');

// Get stdout from a system call
// (exec and execFile require callbacks)
var result = cp.execSync('echo "hello world!"');
