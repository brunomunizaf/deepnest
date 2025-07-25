# DeepNest Setup Script para Windows
# Este script automatiza a instalação e configuração do DeepNest no Windows
# Autor: Assistente IA
# Data: $(Get-Date)

Write-Host "🚀 Iniciando setup do DeepNest..." -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green

# Verificar se Node.js está instalado
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js encontrado: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js não encontrado. Por favor, instale o Node.js primeiro." -ForegroundColor Red
    Write-Host "   Visite: https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

# Verificar se npm está instalado
try {
    $npmVersion = npm --version
    Write-Host "✅ npm encontrado: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm não encontrado. Por favor, instale o npm primeiro." -ForegroundColor Red
    exit 1
}

# Verificar se estamos no diretório correto
if (-not (Test-Path "package.json")) {
    Write-Host "❌ package.json não encontrado. Certifique-se de estar no diretório do DeepNest." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Diretório DeepNest confirmado" -ForegroundColor Green

# Limpar instalações anteriores (opcional)
Write-Host ""
Write-Host "🧹 Limpando instalações anteriores..." -ForegroundColor Yellow
if (Test-Path "node_modules") { Remove-Item -Recurse -Force "node_modules" }
if (Test-Path "build") { Remove-Item -Recurse -Force "build" }

# Instalar dependências
Write-Host ""
Write-Host "📦 Instalando dependências..." -ForegroundColor Yellow
npm install

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Falha na instalação das dependências" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Dependências instaladas com sucesso" -ForegroundColor Green

# Compilar TypeScript
Write-Host ""
Write-Host "🔨 Compilando TypeScript..." -ForegroundColor Yellow
& "./node_modules/.bin/tsc"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Falha na compilação do TypeScript" -ForegroundColor Red
    exit 1
}

Write-Host "✅ TypeScript compilado com sucesso" -ForegroundColor Green

# Rebuild das dependências nativas
Write-Host ""
Write-Host "🔧 Rebuild das dependências nativas..." -ForegroundColor Yellow
& "./node_modules/.bin/electron-rebuild"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Falha no rebuild das dependências nativas" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Dependências nativas rebuildadas com sucesso" -ForegroundColor Green

# Verificar se o build foi criado
if (-not (Test-Path "build")) {
    Write-Host "❌ Diretório build não foi criado" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Diretório build criado" -ForegroundColor Green
Get-ChildItem "build" | ForEach-Object { Write-Host "   $($_.Name)" -ForegroundColor Cyan }

# Testar se o aplicativo pode ser iniciado
Write-Host ""
Write-Host "🧪 Testando inicialização do aplicativo..." -ForegroundColor Yellow
Write-Host "   (Aguarde alguns segundos para o teste)" -ForegroundColor Gray

# Iniciar o aplicativo em background
$job = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    npm start
}

# Aguardar um pouco e verificar
Start-Sleep -Seconds 6

# Verificar se o job ainda está rodando
if ($job.State -eq "Running") {
    Write-Host "✅ Aplicativo iniciado com sucesso" -ForegroundColor Green
    Stop-Job $job
    Remove-Job $job
} else {
    Write-Host "⚠️  Aplicativo pode ter problemas de inicialização" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Setup do DeepNest concluído!" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green
Write-Host ""
Write-Host "Para executar o DeepNest:" -ForegroundColor White
Write-Host "   npm start" -ForegroundColor Cyan
Write-Host ""
Write-Host "Para desenvolvimento:" -ForegroundColor White
Write-Host "   `$env:deepnest_debug=1; npm start" -ForegroundColor Cyan
Write-Host ""
Write-Host "Para build de distribuição:" -ForegroundColor White
Write-Host "   npm run dist" -ForegroundColor Cyan
Write-Host ""
Write-Host "📝 Notas importantes:" -ForegroundColor White
Write-Host "   - O aplicativo pode mostrar alguns avisos do DevTools (normal)" -ForegroundColor Gray
Write-Host "   - Se houver problemas, verifique os logs no terminal" -ForegroundColor Gray
Write-Host "   - Para debug, use: `$env:deepnest_debug=1; npm start" -ForegroundColor Gray
Write-Host ""
Write-Host "✅ DeepNest está pronto para uso!" -ForegroundColor Green 