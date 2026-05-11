# Usage (after your WebSocket API is live on Render etc.):
#   .\scripts\redeploy-vercel-with-ws.ps1 -ChatWsUrl "wss://chaty-ws.onrender.com"
param(
    [Parameter(Mandatory = $true)]
    [string] $ChatWsUrl
)
$ErrorActionPreference = "Stop"
Set-Location (Split-Path $PSScriptRoot -Parent)
$env:CHAT_WS_URL = $ChatWsUrl
npm run build
npx vercel env add CHAT_WS_URL production --value $ChatWsUrl --yes --force --no-sensitive 2>$null
npx vercel deploy --prod --yes
