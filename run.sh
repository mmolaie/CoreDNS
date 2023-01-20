#!/bin/bash

docker run -d -p 53:53/udp --name dns -v "$(pwd)/Corefile":/tmp/Corefile -v $(pwd):/tmp/zone coredns
