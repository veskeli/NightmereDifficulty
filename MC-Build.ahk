#Requires AutoHotkey v2.0
#SingleInstance Force
directory := A_ScriptDir "\Datapack\nightmare"
Run A_ComSpec ' /k "cd ' directory ' && mcb"'
ExitApp