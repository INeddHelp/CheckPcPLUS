# CheckPcPLUS

(It only works on linux for now)

CheckPC+ is an open-source PC scanner that allows you to monitor the processes running on your system and their memory usage. It's designed to be easy to use and customizable for different use cases.

This is only a part of what it should print out
![screenshot](https://ibb.co/b7Qc6jw)
## Installation

Clone the repository:
```bash
git clone https://github.com/INeddHelp/CheckPcPLUS.git
cd path/to/CheckPcPLUS
```

Make the file 'install_checkpcplus.sh' executable by running this command:
```bash
chmod +x install_checkpcplus.sh
```

Once it's done, you can run the command in the terminal:
```bash
checkpcplus
```

## Usage

When you run the checkpcplus command, the script will list all currently running processes along with their process ID, command line, and memory usage. It will then ask you if you want to save the log file to your desktop.

If you choose to save the log file, it will create a file named processes.log on your desktop and write the process information to it. If you choose not to save the log file, the script will exit.

# License

CheckPC+ is released under the MIT License.
