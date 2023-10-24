#Requires AutoHotkey v2.0
PathToFile := A_ScriptDir "\location.txt"
NewDatapack := A_ScriptDir "\Datapack\nightmare"
OldDatapackDir := ReadLocationFromFile(PathToFile)
OldDatapack := OldDatapackDir "\nightmare"

if(OldDatapackDir == "")
    return

if(FileExist(NewDatapack) and FileExist(OldDatapackDir))
{
    if(FileExist(OldDatapack))
        FileDelete(OldDatapack)
    FileCopy(NewDatapack,OldDatapackDir "\nightmare",true)
}
return

ReadLocationFromFile(PathToFile)
{
    if(FileExist(PathToFile))
    {
        FileToRead := FileRead(PathToFile)
        loop parse, FileToRead, "`n"
        {
            return A_LoopField
        }
    }
    else
    {
        MsgBox("Location Not found")
        return ""
    }
}