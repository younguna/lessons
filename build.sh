#!/bin/bash

gitbook build
sudo cp -R _book/* docs/