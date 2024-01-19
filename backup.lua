local lfs = require("lfs")
local os = require("os")

local function copyFile(src, dest)
    local inputFile = io.open(src, "rb")
    local outputFile = io.open(dest, "wb")

    if inputFile and outputFile then
        outputFile:write(inputFile:read("*a"))
        inputFile:close()
        outputFile:close()
        return true
    else
        return false
    end
end

local function backupDirectory(sourceDir, backupDir)
    for file in lfs.dir(sourceDir) do
        if file ~= "." and file ~= ".." then
            local srcPath = sourceDir .. "/" .. file
            local destPath = backupDir .. "/" .. file

            if lfs.attributes(srcPath, "mode") == "file" then
                print("Backing up: " .. file)
                local success = copyFile(srcPath, destPath)

                if success then
                    print("Backup successful.")
                else
                    print("Backup failed.")
                end
            elseif lfs.attributes(srcPath, "mode") == "directory" then
                local newBackupDir = backupDir .. "/" .. file
                lfs.mkdir(newBackupDir)
                backupDirectory(srcPath, newBackupDir)
            end
        end
    end
end

local function backupUserData(backupDir)
    local userDirs = {
        os.getenv("HOME") .. "/Desktop",
        os.getenv("HOME") .. "/Documents",
        os.getenv("HOME") .. "/Downloads",
        os.getenv("HOME") .. "/Pictures",
    }

    print("Starting backup...\n")

    for _, userDir in ipairs(userDirs) do
        if lfs.attributes(userDir) then
            backupDirectory(userDir, backupDir)
        else
            print("Directory not found: " .. userDir)
        end
    end

    print("\nBackup completed.")
end

local args = {...}
local backupDir = args[1]

if not backupDir then
    print("Usage: lua script.lua <backup_directory>")
    os.exit(1)
end

backupUserData(backupDir)
