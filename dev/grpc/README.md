# GRPC

> Protocol Buffers are language-neutral, platform-neutral extensible mechanisms for serializing structured data.
>
> -- https://protobuf.dev/


How-to (Python):
https://medium.com/engineering-semantics3/a-simplified-guide-to-grpc-in-python-6c4e25f0c506

Protobuf `.proto` files are then turned into auto-generated classes imported by the server and client implementations.

 In python, this is the magic line that does the conversion:

 ```
$ python -m grpc_tools.protoc -I</path/to/file_proto_dir> --python_out=</path/to/output> --grpc_python_out=</path/to/output> </path/to/file.proto>
```

(Note the lack of space between `-I` and the subsequent path.)

This produces two output files, `file_pb2.py` and `file_pb2_grpc.py`. The second of these imports from the first and this import seems to break in many circumstances -- the workaround is to replace the import manually with whatever comports with the project structure.
