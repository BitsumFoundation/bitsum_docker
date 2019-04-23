#!/bin/bash
tag=latest
name=node
docker build -f Dockerfile -t bitsum/$name:$tag .
