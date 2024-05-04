::Code;
	@ECHO off

	::Main menu code;

		::Main menu display;
			:Menu
			CLS
			COLOR 0e
			ECHO =============================================
			ECHO Menu:         %DATE% - %TIME%
			ECHO =============================================
			ECHO.
			ECHO.
			ECHO Selecciona una Opcion:
			ECHO.
			ECHO 1. Crear Carpeta
			ECHO 2. Crear Arquitecturas (NEW)
			ECHO 3. Otras
			ECHO 4. Salir
			ECHO.
			ECHO.
			ECHO State the number of your CHOICE
			ECHO.
			SET /p CHOICE=
			IF %CHOICE% EQU 1 GOTO shutdownm & REM GOTO SHUTDOWN menu
			IF %CHOICE% EQU 2 GOTO archivosm & REM GOTO ARCHIVOS menu
			IF %CHOICE% EQU 3 GOTO timer & REM GOTO timer menu
			IF %CHOICE% EQU 4 GOTO EXIT & REM GOTO EXIT
			GOTO bug & REM Redirect to bug page
		;

		::SHUTDOWN menu;
			:shutdownm
			CLS
			COLOR 9
			ECHO ---------------------------
			ECHO SHUTDOWN Procedures Menu
			ECHO.
			ECHO Press E to EXIT to menu
			ECHO ----------------------------
			ECHO.
			ECHO.
			ECHO What would you like to DO?
			ECHO.
			ECHO 1. Crear carpeta
			ECHO 2. Logoff
			ECHO 3. Sleep
			ECHO.
			ECHO Ingresa el numero de opcion:
			ECHO.
			SET /p CHOICE=
			IF %CHOICE% EQU 1 GOTO crearfolder & REM GOTO CREARFOLDER code
			IF %CHOICE% EQU 2 GOTO Logoff & REM GOTO logoff code
			IF %CHOICE% EQU 3 GOTO Sleep & REM GOTO sleep code
			IF %CHOICE% EQU 5 GOTO Rest & REM GOTO rest code
			IF %CHOICE% EQU 6 GOTO Menu & REM GOTO main menu display

			::CREARFOLDER code;
				:crearfolder
				SET /p TITLE=TITULO (no debe contener espacios):

				if exist "SALIDA\%TITLE%" (
					ECHO.
					ECHO !!Ya existe el subdirectorio!!
				)
				if not exist "SALIDA\%TITLE%" (
    					MKDIR SALIDA\%TITLE%
					ECHO.
					ECHO Carpeta %TITLE% creada... :D
				)

				ECHO Presione cualquier tecla para continuar...
				ECHO.
				PAUSE > NUL
				GOTO Menu & REM GOTO main menu display
			;
			::Logoff code;
				:Logoff
				CLS
				ECHO You have chosen Logoff
				ECHO.
				ECHO IF this is NOT your CHOICE press E
				SET /p logoffe=
				IF %logoffe% EQU E GOTO shutdownm & REM GOTO SHUTDOWN menu
				IF %logoffe% EQU e GOTO shutdownm & REM ''''''''''''''''''
				CLS
				ECHO How long before Logoff?
				ECHO.
				SET /p Logtime=
				CLS
				TIMEOUT %logtime%
				SHUTDOWN -l
				EXIT
			;

			::Sleep code;
				:Sleep
				CLS
				ECHO You have chosen Sleep
				ECHO.
				ECHO IF this is NOT your CHOICE press E
				SET /p sleepe=
				IF %sleepe% EQU E GOTO shutdownm & REM GOTO SHUTDOWN menu
				IF %sleepe% EQU e GOTO shutdownm & REM ''''''''''''''''''
				CLS
				ECHO How long before Sleep?
				ECHO.
				SET /p sleeptime=
				CLS
				TIMEOUT %sleeptime%
				SHUTDOWN -h
				EXIT
			;

			::Rest code;
				:Rest
				CLS
				START C:\Windows\System32\aurora.scr /MAX
				IF %ERRORLEVEL% NEQ 0 GOTO ERROR & REM Redirect to error page
				GOTO Menu & REM GOTO main menu display
			;
		;

		::ARCHIVOS menu;
			:archivosm
			CLS
			COLOR 6
			ECHO ---------------------------
			ECHO Arquitectura de archivos Menu
			ECHO.
			ECHO Press E to EXIT to menu
			ECHO ----------------------------
			ECHO.
			ECHO Elija una opcion:
			ECHO.
			ECHO 1. Crear Arquitectura [Node] (Hexagonal)
			ECHO 2. Crear Arquitectura [React JS] (Hexagonal)
			ECHO 3. Crear Arquitectura [Javascript JS]
			ECHO 4. prox...
			ECHO 5. Limpiar/Eliminar Todas Creadas [X]
			ECHO 6. Salir
			ECHO.
			ECHO Ingresa el numero de opcion:
			ECHO.
			SET /p CHOICE=
			IF %CHOICE% EQU 1 GOTO NodeArquitectura & REM GOTO NODEARCHITETURE code
			IF %CHOICE% EQU 2 GOTO ReactArquitectura & REM GOTO REACTARCHITETURE code
			IF %CHOICE% EQU 3 GOTO ReactArquitectura & REM GOTO REACTARCHITETURE code
			IF %CHOICE% EQU 5 GOTO limpiarArquitectura & REM GOTO LIMPIARARCHITETURE code
			IF %CHOICE% EQU 6 GOTO Sleep & REM GOTO sleep code

			::NODEARCHITETURE code;
				:NodeArquitectura
				set carpeta="MODULOS"
				set tecno="Node"
				set template="TEMPLATES"
				SET /p TITLE=NOMBRE MODULO (no debe contener espacios):

				if exist "%carpeta%\%tecno%\%TITLE%" (
					ECHO.
					ECHO !!Ya existe el módulo %TITLE% creado!!
				)
				if not exist "%carpeta%\%tecno%\%TITLE%" (
    					MKDIR %carpeta%\%tecno%\%TITLE%
    					MKDIR %carpeta%\%tecno%\%TITLE%\Infrastructure
    					MKDIR %carpeta%\%tecno%\%TITLE%\Infrastructure\Controllers
    					MKDIR %carpeta%\%tecno%\%TITLE%\Application
    					MKDIR %carpeta%\%tecno%\%TITLE%\Application\Services
    					MKDIR %carpeta%\%tecno%\%TITLE%\Domain
    					MKDIR %carpeta%\%tecno%\%TITLE%\Domain\Interfaces
    					MKDIR %carpeta%\%tecno%\%TITLE%\Domain\Models
    					MKDIR %carpeta%\%tecno%\%TITLE%\Domain\Dto
						COPY %template%\%tecno%\App.js %carpeta%\%tecno%\%TITLE%\Application\Services\%TITLE%Service.js
					ECHO.
					tree %carpeta%\%tecno% /f
					ECHO.
					ECHO Modulo %TITLE% creado en %tecno% ... :D
				)

				ECHO Presione cualquier tecla para continuar...
				ECHO.
				PAUSE > NUL
				GOTO Menu & REM GOTO main menu display
			;

			::REACTARCHITETURE code;
				:ReactArquitectura
				set carpeta="MODULOS"
				set tecno="React"
				tree modulos\Node
				ECHO Presione cualquier tecla para continuar...
				ECHO.
				PAUSE > NUL
				GOTO Menu & REM GOTO main menu display
			;
			::LIMPIARARCHITETURE code;
				:LimpiarArquitectura
				set carpeta="MODULOS"
				@RD /S /Q  %carpeta%
				MKDIR %carpeta%
				tree %carpeta% /f
				ECHO.
				ECHO "Carpeta Modulos Restaurada!!"
				ECHO Presione cualquier tecla para continuar...
				ECHO.
				PAUSE > NUL
				GOTO Menu & REM GOTO main menu display
			;
		;

		::ERROR page;
			:ERROR
			COLOR 04
			CLS
			ECHO                               ERROR
			ECHO.
			ECHO.
			ECHO An error has occured
			ECHO.
			ECHO Press any key to go back to the menu
			PAUSE > NUL
			GOTO Menu & REM GOTO main menu display
		;

		::Bug page;
			:bug
			CLS
			ECHO A bug has occured and you have been redirected to the bug page
			ECHO This is probably because you typed something that was invalid.
			ECHO IF this is NOT the case I strongly urge you to e-mail me at:
			ECHO.
			ECHO Mykael.K23@gmail.com
			ECHO.
			ECHO.
			ECHO Press any key to go back to the menu
			PAUSE > NUL
			GOTO Menu & REM GOTO main menu display
		;

:: https://content.instructables.com/FGP/9SY7/HAOPV3KT/FGP9SY7HAOPV3KT.bat