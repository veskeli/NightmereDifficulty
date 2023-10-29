#Requires AutoHotkey v2.0
#SingleInstance Force
PathToFile := A_ScriptDir "\location.txt"
NewDatapack := A_ScriptDir "\Datapack\nightmare"
OldDatapackDir := ReadLocationFromFile(PathToFile)
OldDatapack := OldDatapackDir "\nightmare"

if(DirExist(NewDatapack) and DirExist(OldDatapackDir))
{
    if(DirExist(OldDatapack))
    {
        DirDelete(OldDatapack,1)
    }
    DirCopy(NewDatapack,OldDatapackDir "\nightmare",true)
}
else
{
    MsgBox("Old or new folder not found")
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