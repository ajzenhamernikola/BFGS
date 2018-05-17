@echo off

:: Main
if not exist "%ANACONDA3_ROOT%" ( 
	set /p answer=Environment variable ANACONDA3_ROOT is not set. Would you like to use the default location: D:\Users\User\Anaconda3? [y/n] 
	if "%answer%"=="y" ( 
		set ANACONDA3_ROOT=D:\Users\User\Anaconda3
	) else (
		set /p a3_path=Please enter the instalation directory for Anaconda3: 
		set ANACONDA3_ROOT="%a3_path%"
	)
)

call :start_jupyter
exit /b

:start_jupyter
pushd .
call %ANACONDA3_ROOT%\Scripts\activate.bat %ANACONDA3_ROOT%
popd
jupyter notebook
exit /b