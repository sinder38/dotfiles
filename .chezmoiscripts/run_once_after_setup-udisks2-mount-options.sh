#!/bin/bash

# Allow writing to win usb sticks

sudo tee /etc/udisks2/mount_options.conf > /dev/null << 'EOF'
[defaults]
vfat_defaults=uid=$UID,gid=$GID,shortname=mixed,utf8=1,showexec,flush
vfat_allow=uid=$UID,gid=$GID,flush,utf8,shortname,umask,dmask,fmask,codepage,iocharset,usefree,showexec

exfat_defaults=uid=$UID,gid=$GID,iocharset=utf8,errors=remount-ro
exfat_allow=uid=$UID,gid=$GID,dmask,errors,fmask,iocharset,namecase,umask

ntfs_defaults=uid=$UID,gid=$GID,windows_names
ntfs_allow=uid=$UID,gid=$GID,umask,dmask,fmask,locale,norecover,ignore_case,windows_names,compression,nocompression,big_writes

ntfs:ntfs3_defaults=uid=$UID,gid=$GID,umask=0022
ntfs:ntfs3_allow=uid=$UID,gid=$GID,umask,dmask,fmask,iocharset,discard,nodiscard,sparse,nosparse,hidden,nohidden,sys_immutable,nosys_immutable,showmeta,noshowmeta,prealloc,noprealloc,hide_dot_files,nohide_dot_files,windows_names,nocase,case
ntfs_drivers=ntfs3,ntfs
EOF
