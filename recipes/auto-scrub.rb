#
# Cookbook Name:: zfs_linux
# Recipe:: auto-scrub
#
# Copyright 2013, Biola University 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

output = `zpool list | tail -n +2 | cut -d ' ' -f 1 | tr "\n" "," | sed '$s/.$//'`

zpoolLocation = `which zpool`.strip

# Weekly jobs
if output.split(",").length < 5
  # Run the scrub once a week on Sunday
  weekstart = 1
  weekend = 7
  output.split(",").each do | pool |
    cron_d "scrub_" + pool do
      minute 0
      hour 2
      weekday 0
      command "[ $(date +\\%d) -ge " + weekstart.to_s + " -a $(date +\\%d) -le " + weekend.to_s + " ] && " + zpoolLocation + " scrub " + pool
    end
    weekstart += 7
    weekend += 7
  end
# Monthly jobs
elsif output.split(",").length < 13
  monthint = 1
  output.split(",").each do | pool |
    cron_d "scrub_" + pool do
      minute 0
      hour 2
      weekday 0
      month monthint
      command "[ $(date +\\%d) -le 7 ] && " + zpoolLocation + " scrub " + pool
    end
    monthno += 1
  end
else
  log "Too many zpools to automatically schedule scrubbing! Manual intervention required"
end
