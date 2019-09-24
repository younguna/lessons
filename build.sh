#!/bin/bash

gitbook build
sudo cp -R _book/Contents docs/
sudo cp -R _book/gitbook docs/
sudo cp -R _book/images docs/
sudo cp -R _book/index.html docs/
sudo cp -R _book/search_index.json docs/