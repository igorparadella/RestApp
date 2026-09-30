@echo off
setlocal EnableExtensions EnableDelayedExpansion

title Reiniciador do Godot

set "PROCESSO=Godot_v4.7.2-stable_win64.exe"
set "APLICATIVO=C:\Users\igork\Apps\Godot\Godot_v4.7.2-stable_win64.exe"

:: ========================================
:: CONFIGURACAO
:: ========================================

:: true  = fecha o terminal automaticamente
:: false = deixa o terminal aberto no final
set "FECHAR_TERMINAL=true"


echo.
echo ========================================
echo       REINICIANDO O GODOT
echo ========================================
echo.

echo Processo configurado:
echo %PROCESSO%
echo.

echo Caminho configurado:
echo %APLICATIVO%
echo.

echo ========================================
echo 1 - VERIFICANDO PROCESSO
echo ========================================
echo.

tasklist /FI "IMAGENAME eq %PROCESSO%" /NH

echo.
echo ========================================
echo 2 - ENCERRANDO PROCESSO
echo ========================================
echo.

taskkill /F /IM "%PROCESSO%" /T

echo.
echo Codigo retornado pelo taskkill: %ERRORLEVEL%
echo.

echo ========================================
echo 3 - VERIFICANDO SE FOI ENCERRADO
echo ========================================
echo.

:VERIFICAR

tasklist /FI "IMAGENAME eq %PROCESSO%" /NH | find /I "%PROCESSO%" >nul

if not errorlevel 1 (
    echo O processo ainda esta aberto.
    echo Aguardando 1 segundo...
    timeout /t 1 /nobreak >nul
    goto VERIFICAR
)

echo.
echo PROCESSO NAO ESTA MAIS RODANDO!
echo.

echo ========================================
echo 4 - ABRINDO NOVO GODOT
echo ========================================
echo.

if not exist "%APLICATIVO%" (
    echo.
    echo ERRO!
    echo O arquivo nao foi encontrado:
    echo %APLICATIVO%
    echo.
    goto FIM
)

echo Arquivo encontrado!
echo Abrindo...

start "" "%APLICATIVO%"

echo.
echo Novo Godot iniciado.
echo.

echo ========================================
echo       REINICIO CONCLUIDO
echo ========================================
echo.

:FIM

if /I "%FECHAR_TERMINAL%"=="true" (
    timeout /t 2 /nobreak >nul
    exit
)

echo.
echo ----------------------------------------
echo O SCRIPT TERMINOU.
echo Pressione qualquer tecla para fechar.
echo ----------------------------------------
pause

endlocal