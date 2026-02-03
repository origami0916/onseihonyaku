@echo off
echo ========================================
echo   リアルタイム翻訳ソフト サーバー起動
echo ========================================
echo.
echo ブラウザで http://localhost:8080 を開いています...
echo.
echo 終了するには Ctrl+C を押してください
echo.

REM Pythonが利用可能か確認
python --version >nul 2>&1
if %errorlevel% == 0 (
    start http://localhost:8080
    python -m http.server 8080
    goto :end
)

REM Python3を試す
python3 --version >nul 2>&1
if %errorlevel% == 0 (
    start http://localhost:8080
    python3 -m http.server 8080
    goto :end
)

REM Node.jsのnpxを試す
npx --version >nul 2>&1
if %errorlevel% == 0 (
    start http://localhost:8080
    npx serve -p 8080
    goto :end
)

echo エラー: Python または Node.js がインストールされていません。
echo 以下のいずれかをインストールしてください：
echo   - Python: https://www.python.org/downloads/
echo   - Node.js: https://nodejs.org/
pause

:end
