LFS Notes
=========

Mount Preparation
-----------------

    # mount -v -t ext3 /dev/sda4 $LFS
    
    # mount -v --bind /dev $LFS/dev
    
    # mount -vt devpts devpts $LFS/dev/pts
    # mount -vt tmpfs shm $LFS/dev/shm
    # mount -vt proc proc $LFS/proc
    # mount -vt sysfs sysfs $LFS/sys

Revised chroot | Ch 7
---------------------

    # chroot "$LFS" /usr/bin/env -i \
    HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login

Texinfo Warning
---------------

The Info documentation system uses a plain text file to hold its list of menu
entries. The file is located at `/usr/share/info/dir`. Unfortunately, due to
occasional problems in the Makefiles of various packages, it can sometimes get
out of sync with the info pages installed on the system. If the
`/usr/share/info/dir` file ever needs to be recreated, the following optional
commands will accomplish the task:

    # cd /usr/share/info
    # rm -v dir
    # for f in *
    do install-info $f dir 2>/dev/null
    done

Toolchain Notes [1]
-------------------

**Target triplet**

    i686-pc-linux-gnu

**Dynamic linker**

    ld-linux.so.2

A sure-fire way to determine the name of the dynamic linker is to inspect
a random binary from the host system by running:

    readelf -l <name of binary> | grep interpreter

and noting the output. The authoritative reference covering all platforms
is in the `shlib-versions` file in the root of the Glibc source tree.

**Glibc**

After the run of configure, check the contents of the `config.make` file in
the `glibc-build` directory for all important details. Note the use of 
`CC="i686-lfs-gnu-gcc"` to control which binary tools are used and the use
of the `-nostdinc` and `-isystem` flags to control the compiler's include
search path.

After the Glibc installation, change `gcc`'s specs file to point to the new
dynamic linker in `/tools/lib`. This last step is vital in ensuring that
searching and linking take place only within the `/tools` prefix.

For the second pass of GCC, its sources also need to be modified to tell GCC
to use the new dynamic linker. Failure to do so will result in the GCC
programs themselves having the name of the dynamic linker from the host
system's `/lib` directory embedded into them, which would defeat the goal of
getting away from the host.

During the second pass of Binutils, we are able to utilize the `with-lib-path`
configure switch to control `ld`'s library search path. From this point onwards,
the core toolchain is self-contained and self-hosted.

### Clean up after yourself [2]

After installing each package, delete its source and build directories, unless
specifically instructed otherwise. Deleting the sources prevents
misconfiguration when the same package is reinstalled later.

**pre-chroot**

Before issuing the build instructions for a package, the package should be
unpacked as user `lfs`, and a `cd` into the created directory should be
performed. The build instructions assume that the `bash` shell is in use.

[1](http://www.linuxfromscratch.org/lfs/view/stable/chapter05/toolchaintechnotes.html),
[2](http://www.linuxfromscratch.org/lfs/view/stable/chapter05/generalinstructions.html)

LFS `useradd`
-------------

### GROUP=1000

This parameter sets the beginning of the group numbers used in the `/etc/group`
file. You can modify it to anything you desire. Note that `useradd` will
never reuse a UID or GID. If the number identified in this parameter is used,
it will use the next available number after this. Note also that if you
don't have a group 1000 on your system the first time you use `useradd`
without the `-g` parameter, you'll get a message displayed on the
terminal that says: `useradd: unknown GID 1000`. You may disregard this
message and group number 1000 will be used.

### `CREATE_MAIL_SPOOL=yes`

This parameter causes `useradd` to create a mailbox file for the newly created
user. `useradd` will make the group ownership of this file to the mail group with
0660 permissions. If you would prefer that these mailbox files are not created
by `useradd`, issue the following command:

    sed -i 's/yes/no/' /etc/default/useradd
