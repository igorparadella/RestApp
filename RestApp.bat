@echo off
setlocal EnableExtensions EnableDelayedExpansion

title Reiniciador de Aplicativo

:: ========================================
:: CONFIGURAÇÃO
:: ========================================

set "PROCESSO=Godot_v4.7.2-stable_win64.exe"
set "APLICATIVO=C:\Users\igork\Apps\Godot\Godot_v4.7.2-stable_win64.exe"

:: true  = fecha o terminal
:: false = mantém o terminal aberto
set "FECHAR_TERMINAL=true"


echo.
echo ========================================
echo        REINICIADOR DE APLICATIVO
echo ========================================
echo.

echo Processo: %PROCESSO%
echo Aplicativo: %APLICATIVO%
echo.


:: ========================================
:: VERIFICAR SE O ARQUIVO EXISTE
:: ========================================

if not exist "%APLICATIVO%" (
    echo.
    echo ERRO: aplicativo nao encontrado!
    echo.
    echo Caminho:
    echo %APLICATIVO%
    echo.
    goto FIM
)


:: ========================================
:: ENCERRAR PROCESSO
:: ========================================

echo ========================================
echo ENCERRANDO PROCESSO
echo ========================================
echo.

taskkill /F /IM "%PROCESSO%" /T >nul 2>&1

echo Processo encerrado.
echo.


:: ========================================
:: AGUARDAR ENCERRAMENTO
:: ========================================

echo Aguardando encerramento completo...

:VERIFICAR

tasklist /FI "IMAGENAME eq %PROCESSO%" /NH | find /I "%PROCESSO%" >nul

if not errorlevel 1 (
    timeout /t 1 /nobreak >nul
    goto VERIFICAR
)

echo Processo encerrado completamente.
echo.


:: ========================================
:: INICIAR APLICATIVO
:: ========================================

echo ========================================
echo INICIANDO APLICATIVO
echo ========================================
echo.

echo Abrindo:
echo %APLICATIVO%
echo.

:: Cria um processo completamente separado
start "" /B cmd /c start "" "%APLICATIVO%"

echo Aplicativo iniciado.
echo.


:: ========================================
:: FINAL
:: ========================================

echo ========================================
echo       REINICIO CONCLUIDO
echo ========================================
echo.

if /I "%FECHAR_TERMINAL%"=="true" (
    echo Fechando terminal...
    timeout /t 1 /nobreak >nul
    endlocal
    exit
)

echo.
echo O script terminou.
echo Pressione qualquer tecla para fechar.
pause

endlocal
exit