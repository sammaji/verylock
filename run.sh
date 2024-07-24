#!/bin/bash

iverilog $1.v -o $1.out
./$1.out
rm -rf *.out