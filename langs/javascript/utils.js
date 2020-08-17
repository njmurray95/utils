const cp = require('child_process');

// Get stdout from a system call
// (exec and execFile require callbacks)
const helloWorld = () => {
  var result = cp.execSync('echo "hello world!"');
}

// Do a conversion of 4 int8 bytes to 1 float32
// Instead of how JS normally casts 4 int8's into 4 float32's
const castIntToFloat32 = (src, dst) => {
  // Note: dst.length == src.length / 4
  var dv = new DataView(src.buffer);
  for (var i = 0, j = 0; i < src.byteLength; i+=4, j++) {
    // true for Little Endian, false for Big Endian
    dst[j] = dv.getFloat32(i, true); 
  }
}
