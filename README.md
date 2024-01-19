# Backup Your Files
This automation tool, written in the Lua programming language, is designed to assist you in automatically backing up files from the `Desktop`, `Documents`, `Downloads`, and `Pictures` directories.

## Installation
Ensure that you have Lua and the LuaFileSystem library installed on your Linux system. If `luafilesystem` is not installed, you can install it using `luarocks`:

```bash
sudo luarocks install luafilesystem

```
After that, you will need to change

## Usage
You can run the script on your Linux machine using the Lua interpreter, providing the destination directory of the backup:
```Bash
lua backup.lua </destination/of/your/backup/>
```

## Contributing

>Pull requests are welcome. **For major changes, please open an issue first
to discuss what you would like to change.**


## License

>This project is under [Apache 2.0](https://choosealicense.com/licenses/apache-2.0/) licence.
