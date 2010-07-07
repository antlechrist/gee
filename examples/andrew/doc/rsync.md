from rsync(1)
=============

    rsync -avz foo:src/bar /data/tmp

This would recursively transfer all files from the directory src/bar
on the machine foo into the /data/tmp/bar directory on the local
machine. The files are transferred in "archive" mode, which ensures
that symbolic links, devices, attributes, permissions, ownerships,
etc. are preserved in the transfer. Additionally, compression will be
used to reduce the size of data portions of the transfer.

    rsync -avz foo:src/bar/ /data/tmp

A trailing slash on the source changes this behavior to avoid creating
an additional directory level at the destination. You can think of a
trailing / on a source as meaning "copy the contents of this
directory" as opposed to "copy the directory by name", but in both
cases the attributes of the containing directory are transferred to
the containing directory on the destination. In other words, each of
the following commands copies the files in the same way, including
their setting of the attributes of /dest/foo:

    rsync -av /src/foo /dest
    rsync -av /src/foo/ /dest/foo
