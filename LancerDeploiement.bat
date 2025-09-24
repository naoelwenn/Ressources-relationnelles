@echo off
REM ==================================================
REM Script Windows pour lancer docker compose
REM Double-cliquez simplement sur ce fichier
REM ==================================================

REM -- Aller dans le dossier du script (peu importe où le client l'extrait)
cd /d "%~dp0"

echo.
echo === Vérification de Docker Desktop ===
docker --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo [ERREUR] Docker n'est pas installé ou n'est pas dans le PATH.
    pause
    exit /b 1
)

echo.
echo === Lancement du docker compose ===
docker compose up -d

IF ERRORLEVEL 1 (
    echo [ERREUR] Échec du lancement de docker compose.
    pause
    exit /b 1
)

echo.
echo === Déploiement terminé avec succès ! ===
echo Les conteneurs sont maintenant en cours d'exécution.
pause
