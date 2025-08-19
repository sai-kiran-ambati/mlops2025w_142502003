#!/bin/bash

nl file.txt | \
sort -nr | \
cut -f2-
