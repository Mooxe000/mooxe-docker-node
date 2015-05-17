#!/usr/bin/env coffee

echo = console.log
require 'shelljs/make'

target.build = ->
  exec 'docker build -t mooxe/node .'

target.in = ->
  echo 'docker run -t -i mooxe/node /bin/bash'

target.push = ->
  exec 'docker push mooxe/node'

target.all = ->
  echo 'hello'
