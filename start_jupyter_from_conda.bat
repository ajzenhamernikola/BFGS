@echo off

:: Main
setlocal enabledelayedexpansion
if not exist "%ANACONDA3_ROOT%" ( 
	@echo Environment variable ANACONDA3_ROOT is not set. Would you like to use the default location: D:\Users\User\Anaconda3? [y/n]
	set /P answer=
	if "!answer!"=="y" ( 
		set ANACONDA3_ROOT=D:\Users\User\Anaconda3
	) else (
		@echo Please enter the instalation directory for Anaconda3:
		set /P a3_path=
		set ANACONDA3_ROOT="%a3_path%"
	)
)

call :start_jupyter
exit /b

:start_jupyter
pushd .
@echo Starting Anaconda3 environment...
call !ANACONDA3_ROOT!\Scripts\activate.bat !ANACONDA3_ROOT!
popd
@echo Starting Jupyter notebook in this directory...
jupyter notebook
exit /b