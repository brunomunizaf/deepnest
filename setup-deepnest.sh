#!/bin/bash

# DeepNest Setup Script
# Este script automatiza a instalação e configuração do DeepNest
# Autor: Assistente IA
# Data: $(date)

echo "🚀 Iniciando setup do DeepNest..."
echo "=================================="

# Verificar se Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não encontrado. Por favor, instale o Node.js primeiro."
    echo "   Visite: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js encontrado: $(node --version)"

# Verificar se npm está instalado
if ! command -v npm &> /dev/null; then
    echo "❌ npm não encontrado. Por favor, instale o npm primeiro."
    exit 1
fi

echo "✅ npm encontrado: $(npm --version)"

# Verificar se estamos no diretório correto
if [ ! -f "package.json" ]; then
    echo "❌ package.json não encontrado. Certifique-se de estar no diretório do DeepNest."
    exit 1
fi

echo "✅ Diretório DeepNest confirmado"

# Limpar instalações anteriores (opcional)
echo ""
echo "🧹 Limpando instalações anteriores..."
rm -rf node_modules
rm -rf build

# Instalar dependências
echo ""
echo "📦 Instalando dependências..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Falha na instalação das dependências"
    exit 1
fi

echo "✅ Dependências instaladas com sucesso"

# Compilar TypeScript
echo ""
echo "🔨 Compilando TypeScript..."
./node_modules/.bin/tsc

if [ $? -ne 0 ]; then
    echo "❌ Falha na compilação do TypeScript"
    exit 1
fi

echo "✅ TypeScript compilado com sucesso"

# Rebuild das dependências nativas
echo ""
echo "🔧 Rebuild das dependências nativas..."
./node_modules/.bin/electron-rebuild

if [ $? -ne 0 ]; then
    echo "❌ Falha no rebuild das dependências nativas"
    exit 1
fi

echo "✅ Dependências nativas rebuildadas com sucesso"

# Verificar se o build foi criado
if [ ! -d "build" ]; then
    echo "❌ Diretório build não foi criado"
    exit 1
fi

echo "✅ Diretório build criado: $(ls -la build/)"

# Testar se o aplicativo pode ser iniciado
echo ""
echo "🧪 Testando inicialização do aplicativo..."
echo "   (Pressione Ctrl+C para parar o teste após alguns segundos)"

# Iniciar o aplicativo em background por 5 segundos
timeout 5s npm start &
APP_PID=$!

sleep 6

# Verificar se o processo ainda está rodando
if ps -p $APP_PID > /dev/null 2>&1; then
    echo "✅ Aplicativo iniciado com sucesso"
    kill $APP_PID 2>/dev/null
else
    echo "⚠️  Aplicativo pode ter problemas de inicialização"
fi

echo ""
echo "🎉 Setup do DeepNest concluído!"
echo "=================================="
echo ""
echo "Para executar o DeepNest:"
echo "   npm start"
echo ""
echo "Para desenvolvimento:"
echo "   deepnest_debug=1 npm start"
echo ""
echo "Para build de distribuição:"
echo "   npm run dist"
echo ""
echo "📝 Notas importantes:"
echo "   - O aplicativo pode mostrar alguns avisos do DevTools (normal)"
echo "   - Se houver problemas, verifique os logs no terminal"
echo "   - Para debug, use: deepnest_debug=1 npm start"
echo ""
echo "✅ DeepNest está pronto para uso!" 