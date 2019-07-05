#!/bin/bash

set -e

bash -c "pip install -U ."
bash -c "pytest $*"
