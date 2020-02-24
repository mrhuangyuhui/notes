# [Node.js - File System](https://www.tutorialspoint.com/nodejs/nodejs_file_system.htm)

`input.txt`

```bash
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
```

## Synchronous vs Asynchronous

```js
var fs = require("fs");

// Asynchronous read
fs.readFile('input.txt', function (err, data) {
    if (err) {
        return console.error(err);
    }
    console.log("Asynchronous read: " + data.toString());
});

// Synchronous read
var data = fs.readFileSync('input.txt');
console.log("Synchronous read: " + data.toString());

console.log("Program Ended");
```

```bash
$ node main.js
Synchronous read: Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
Program Ended
Asynchronous read: Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
```

## Open a File

```js
var fs = require("fs");

// Asynchronous - Opening File
console.log("Going to open file!");
fs.open('input.txt', 'r+', function (err, fd) {
    if (err) {
        return console.error(err);
    }
    console.log("File opened successfully!");
});
```

```bash
$ node main.js
Going to open file!
File opened successfully!
```

```js
var fs = require("fs");

console.log("Going to get file info!");
fs.stat('input.txt', function (err, stats) {
    if (err) {
        return console.error(err);
    }
    console.log(stats);
    console.log("Got file info successfully!");

    // Check file type
    console.log("isFile ? " + stats.isFile());
    console.log("isDirectory ? " + stats.isDirectory());
});
```

## Get File Information

```bash
$ node main.js
Going to get file info!
Stats {
  dev: 16777222,
  mode: 33188,
  nlink: 1,
  uid: 501,
  gid: 20,
  rdev: 0,
  blksize: 4194304,
  ino: 8591267456,
  size: 94,
  blocks: 8,
  atimeMs: 1527598644550.5974,
  mtimeMs: 1527512227446.2722,
  ctimeMs: 1527512227446.2722,
  birthtimeMs: 1527512227441.1853,
  atime: 2018-05-29T12:57:24.551Z,
  mtime: 2018-05-28T12:57:07.446Z,
  ctime: 2018-05-28T12:57:07.446Z,
  birthtime: 2018-05-28T12:57:07.441Z }
Got file info successfully!
isFile ? true
isDirectory ? false
```

## Writing a File

```js
var fs = require("fs");

console.log("Going to write into existing file");
fs.writeFile('input.txt', 'Simply Easy Learning!', function (err) {
    if (err) {
        return console.error(err);
    }

    console.log("Data written successfully!");
    console.log("Let's read newly written data");
    fs.readFile('input.txt', function (err, data) {
        if (err) {
            return console.error(err);
        }
        console.log("Asynchronous read: " + data.toString());
    });
});
```

```bash
$ node main.js
Going to write into existing file
Data written successfully!
Let's read newly written data
Asynchronous read: Simply Easy Learning!
```

## Reading a File

```js
var fs = require("fs");
var buf = new Buffer(1024);

console.log("Going to open an existing file");
fs.open('input.txt', 'r+', function (err, fd) {
    if (err) {
        return console.error(err);
    }
    console.log("File opened successfully!");
    console.log("Going to read the file");
    fs.read(fd, buf, 0, buf.length, 0, function (err, bytes) {
        if (err) {
            console.log(err);
        }
        console.log(bytes + " bytes read");

        // Print only read bytes to avoid junk.
        if (bytes > 0) {
            console.log(buf.slice(0, bytes).toString());
        }
    });
});
```

```bash
$ node main.js
Going to open an existing file
File opened successfully!
Going to read the file
94 bytes read
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
```

## Closing a File

```js
var fs = require("fs");
var buf = new Buffer(1024);

console.log("Going to open an existing file");
fs.open('input.txt', 'r+', function (err, fd) {
    if (err) {
        return console.error(err);
    }
    console.log("File opened successfully!");
    console.log("Going to read the file");

    fs.read(fd, buf, 0, buf.length, 0, function (err, bytes) {
        if (err) {
            console.log(err);
        }

        // Print only read bytes to avoid junk.
        if (bytes > 0) {
            console.log(buf.slice(0, bytes).toString());
        }

        // Close the opened file.
        fs.close(fd, function (err) {
            if (err) {
                console.log(err);
            }
            console.log("File closed successfully.");
        });
    });
});
```

```bash
$ node main.js
Going to open an existing file
File opened successfully!
Going to read the file
Tutorials Point is giving self learning content
to teach the world in simple and easy way!!!!!
File closed successfully.
```

## Truncate a File

```js
var fs = require("fs");
var buf = new Buffer(1024);

console.log("Going to open an existing file");
fs.open('input.txt', 'r+', function (err, fd) {
    if (err) {
        return console.error(err);
    }
    console.log("File opened successfully!");
    console.log("Going to truncate the file after 10 bytes");

    // Truncate the opened file.
    fs.ftruncate(fd, 10, function (err) {
        if (err) {
            console.log(err);
        }
        console.log("File truncated successfully.");
        console.log("Going to read the same file");

        fs.read(fd, buf, 0, buf.length, 0, function (err, bytes) {
            if (err) {
                console.log(err);
            }

            // Print only read bytes to avoid junk.
            if (bytes > 0) {
                console.log(buf.slice(0, bytes).toString());
            }

            // Close the opened file.
            fs.close(fd, function (err) {
                if (err) {
                    console.log(err);
                }
                console.log("File closed successfully.");
            });
        });
    });
});
```

```bash
$ node main.js
Going to open an existing file
File opened successfully!
Going to truncate the file after 10 bytes
File truncated successfully.
Going to read the same file
Tutorials 
File closed successfully.
```

## Delete a File

```js
var fs = require("fs");

console.log("Going to delete an existing file");
fs.unlink('input.txt', function (err) {
    if (err) {
        return console.error(err);
    }
    console.log("File deleted successfully!");
});
```

```bash
$ node main.js
Going to delete an existing file
File deleted successfully!
```

## Create a Directory

```js
var fs = require("fs");

console.log("Going to create directory /tmp/test");
fs.mkdir('/tmp/test', function (err) {
    if (err) {
        return console.error(err);
    }
    console.log("Directory created successfully!");
});
```

```bash
$ node main.js
Going to create directory /tmp/test
Directory created successfully!
$ ls -d /tmp/test/
/tmp/test/
```

## Read a Directory

```js
var fs = require("fs");

console.log("Going to read directory /tmp");
fs.readdir("/tmp/test", function (err, files) {
    if (err) {
        return console.error(err);
    }
    files.forEach(function (file) {
        console.log(file);
    });
});
```

```bash
$ touch /tmp/test/apple
$ touch /tmp/test/banana
$ touch /tmp/test/orange
$ node main.js
Going to read directory /tmp
apple
banana
orange
```

## Remove a Directory

```bash
var fs = require("fs");

console.log("Going to delete directory /tmp/test");
fs.rmdir("/tmp/test", function (err) {
    if (err) {
        return console.error(err);
    }
});
```

```bash
$ node main.js
# 删除非空文件夹报错
Going to delete directory /tmp/test
{ Error: ENOTEMPTY: directory not empty, rmdir '/tmp/test'
  errno: -66,
  code: 'ENOTEMPTY',
  syscall: 'rmdir',
  path: '/tmp/test' }
# 清空文件夹
$ rm -f /tmp/test/*
# 再次删除
$ node main.js
Going to delete directory /tmp/test
# 删除成功
$ ls -d /tmp/test
ls: /tmp/test: No such file or directory
```