# This file is used for storing all settings regarding the VMware configuration backup

# list of vcenter servers
$vcenters = @(
    @{
        server = "MYSERVER"
        user = "MY USER"
        password = "MY PASSWORD"
        protocol = "https"
    }
)

# location to backup data. Should end with a backslash (\)
# structure in this folder will be:
# .
# ├── myvcenter1\
# │   ├── mydc1\
# │   │   ├── configBundle-myhost1.tgz
# │   │   ├── configBundle-myhost2.tgz
# │   │   ├── configBundle-myhost3.tgz
# │   ├── mydc2\
# │   │   ├── configBundle-myhost4.tgz
# │   │   ├── configBundle-myhost5.tgz
# │   │   ├── configBundle-myhost6.tgz
# ├── myvcenter2
# │   ├── mydc3
# │   │   ├── configBundle-myotherhost1.tgz
# │   │   ├── configBundle-myotherhost2.tgz
# │   │   ├── configBundle-myotherhost3.tgz
$backuplocation = "C:\Backup\VMware\"