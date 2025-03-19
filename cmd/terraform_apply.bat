@echo off

cd ..\

docker compose ^
    --profile apply ^
    up ^
        --detach ^
        --force-recreate

docker compose ^
    --profile apply ^
    logs ^
        --follow ^
        --timestamps

pause
