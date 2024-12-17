#!/bin/bash

# Run the Docker container with the specified options
docker run -it -p 3000:8080 -p 3001:8081 --restart=always --name seanime coyann/seanime
