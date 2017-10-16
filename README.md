# backup-manager-cli 
> Backup and archive any file or folder with one command.

## Usage
`$ backup [file_name] [dir_name] ...` 

## What's done?
1. Packing / archivings file 
2. Move archive to ~/Backup 
3. Create and update logs (md5, size, tree,..)

# Output
`$ backup -md` 
show list of backup files with md5

----------
## Install 

`$ git clone https://github.com/loydle/backup-manager-cli.git`

`$ cp [download_directory]/backup-manager-cli/bin/backup /usr/local/bin/backup` 

`$ chmod 755 /usr/local/bin/backup`

`$ vim ~/.bash profile`

add the following line to ~/.bash_profile 

```bash
export PATH=$PATH:.

```


### Restart terminal, done! :thumbsup:

----------


### MIT License

2017 DigitalSC.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
