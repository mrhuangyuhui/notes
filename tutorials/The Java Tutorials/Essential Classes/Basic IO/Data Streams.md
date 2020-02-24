[toc]

# Data Streams [>>](https://docs.oracle.com/javase/tutorial/essential/io/datastreams.html)

[DataStreams.java](https://docs.oracle.com/javase/tutorial/essential/io/examples/DataStreams.java)

Data streams support ==binary I/O== of primitive data type values (boolean, char, byte, short, int, long, float, and double) as well as String values.

Notice that DataStreams detects an end-of-file condition by catching ==EOFException==, instead of testing for an invalid return value. All implementations of DataInput methods use EOFException instead of return values.