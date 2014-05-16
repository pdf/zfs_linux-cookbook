default['zol']['zfs_repo']                 = "https://github.com/zfsonlinux/zfs.git"
default['zol']['spl_repo']                 = "https://github.com/zfsonlinux/spl.git"
default['zol']['zfs_commit']               = "bc25c9325b0e5ced897b9820dad239539d561ec9"
default['zol']['spl_commit']               = "ad3412efd7cc2debb0f9f354d3f5e105a99d97e1"

case node['platform_version']
when '12.04'
  default['zol']['mountall_url']           = "http://ppa.launchpad.net/zfs-native/daily/ubuntu/pool/main/m/mountall/mountall_2.36.4-zfs2_amd64.deb"
  default['zol']['mountall_checksum']      = "21c48d17d76bbc83b58ba4c62f26bb7c9dd5e7cdab7bb100eb9ed417194da97b"
when '14.04'
  default['zol']['mountall_url']           = "http://ppa.launchpad.net/zfs-native/daily/ubuntu/pool/main/m/mountall/mountall_2.53-zfs1_amd64.deb"
  default['zol']['mountall_checksum']      = "87f33148dd06f861f757f472464a60015bac3595ad73e4deac7a1968adec356d"
end
