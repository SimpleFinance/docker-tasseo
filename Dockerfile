# Tasseo
# VERSION        1.0
#
# Copyright 2013 Simple Finance Technology Corp. All rights reserved.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#
# See http://github.com/SimpleFinance/docker-tasseo for usage, source, and license.
#
# https://github.com/obfuscurity/tasseo is the code base.
#
# You should run with:
#   docker run -d -e GRAPHITE_URL=http://yourgraphiteserver -p 5000 -v /path/to/dashboards:/tasseo/dashboards swenson/tasseo

from ubuntu
maintainer Christopher Swenson <swenson@simple.com>

# base ubuntu stuff
env DEBIAN_FRONTEND noninteractive
run echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
run apt-get update
run apt-get upgrade -y
run apt-get install -y unzip curl

# install dependencies
run curl -L https://get.rvm.io | bash -s stable --ruby
run bash -l -c rvm requirements

# fetch source
run apt-get install -y git
run git clone https://github.com/obfuscurity/tasseo

# build
run apt-get install -y rubygems
run gem install bundler
run gem install foreman
run cd tasseo && /usr/local/rvm/bin/rvm use 1.9.2
run cd tasseo && bundle install

# start
expose 5000
entrypoint cd tasseo && foreman start
