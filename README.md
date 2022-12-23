# Backup Manager CLI

This script allows you to create backups of specified folders or files and store them in a destination folder. It also maintains a log of all the backups that have been created.

## Purpose

The purpose of this script is to provide an easy way to create backups of important files and folders, and store them in a designated location. The script also maintains a log of all the backups that have been created, which includes the date and time of the backup, the destination folder, the source folders, and the list of files included in the backup.
## Usage

To use the script, run the following command:

```
./backup.sh [-s source_folder]... [-d destination_folder] [-n name] [-l] [-h]

```

### Options

* `-s source_folder`: The source folder or file to be included in the backup (can be specified multiple times).
* `-d destination_folder`: The destination folder for the backup.
* `-n name`: The name of the backup.
* `-l`: View the backup log.
* `-h`: Display the usage message.

### Examples

To create a backup of the `docs` and `images` folders and store it in the `backups` folder with the name `2022-01-01`, run the following command:

```
./backup.sh -s docs -s images -d backups -n "2022-01-01"
```

To view the backup log, run the following command:

```
./backup.sh -l
```

## Log Format

The log file (`backup.log.md`) is a Markdown file that contains the following information for each backup:

* Date and time of the backup.
* Destination folder.
* Source folders.
* List of files included in the backup.

## Additional Notes

* If the destination folder does not exist, it will be created.
* The script uses the `zip` command to create a ZIP archive of the source folders and stores it in the destination folder.
* The script uses the `realpath` command to get the absolute paths of the source folders and the files included in the backup.
