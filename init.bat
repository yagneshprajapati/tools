@echo off
color 0E

REM Function to add a collaborator
:AddCollaborator
set collaboratorChoice=yagneshprajapati

set "collaborator="
if /i "%collaboratorChoice%"=="yagneshprajapati" set "collaborator=yagneshprajapati"
if /i "%collaboratorChoice%"=="Bhargav-Tiwari" set "collaborator=Bhargav-Tiwari"
if /i "%collaboratorChoice%"=="sawvisha" set "collaborator=sawvisha"
if /i "%collaboratorChoice%"=="SohamDorge03" set "collaborator=SohamDorge03"

if not defined collaborator (
    echo Invalid collaborator choice. Please choose a valid collaborator.
    goto AddCollaborator
)

if not exist ".git" (
    git init
    git remote add origin https://github.com/yagneshprajapati/yptools.git
    echo.
    echo Repository initialized and remote added successfully.
    echo.

    rem Check if collaborator is already added
    git ls-remote --exit-code origin %collaborator%/%branch% > nul 2>&1
    if errorlevel 1 (
        rem Collaborator not found, add collaborator automatically
        git remote add %collaborator% https://github.com/yagneshprajapati/tools.git
        echo Collaborator %collaborator% added successfully.
    ) else (
        echo Collaborator %collaborator% already added.
    )
) else (
    echo Repository already exists. Please choose another location.
)
