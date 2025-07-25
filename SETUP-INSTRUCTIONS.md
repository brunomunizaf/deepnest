# 🚀 DeepNest Setup Automatizado

Este script automatiza todo o processo de instalação e configuração do DeepNest.

## 📋 Pré-requisitos

Antes de executar o script, certifique-se de ter instalado:

1. **Node.js** (versão 16 ou superior)
   - Download: https://nodejs.org/
   - Verificar: `node --version`

2. **npm** (vem com Node.js)
   - Verificar: `npm --version`

## 🎯 Como Usar

### Opção 1: Script Automatizado (Recomendado)

```bash
# 1. Clone ou baixe o repositório DeepNest
git clone https://github.com/deepnest-next/deepnest.git
cd deepnest

# 2. Execute o script de setup
./setup-deepnest.sh
```

### Opção 2: Comandos Manuais

Se preferir executar os comandos manualmente:

```bash
# 1. Instalar dependências
npm install

# 2. Compilar TypeScript
./node_modules/.bin/tsc

# 3. Rebuild dependências nativas
./node_modules/.bin/electron-rebuild

# 4. Executar aplicativo
npm start
```

## 🔧 O que o Script Faz

1. **✅ Verificações**
   - Node.js instalado
   - npm disponível
   - Diretório correto

2. **🧹 Limpeza**
   - Remove `node_modules` antigos
   - Remove `build` antigo

3. **📦 Instalação**
   - Instala todas as dependências
   - Configura dependências nativas

4. **🔨 Compilação**
   - Compila TypeScript para JavaScript
   - Cria diretório `build/`

5. **🔧 Rebuild**
   - Rebuild das dependências nativas
   - Compatibilidade com Electron

6. **🧪 Teste**
   - Testa inicialização do aplicativo
   - Verifica se tudo funciona

## 🎮 Como Executar o DeepNest

### Execução Normal
```bash
npm start
```

### Modo Debug (com logs detalhados)
```bash
deepnest_debug=1 npm start
```

### Build de Distribuição
```bash
npm run dist
```

## ⚠️ Solução de Problemas

### Problema: "tsc: command not found"
```bash
# Use o TypeScript local
./node_modules/.bin/tsc
```

### Problema: "electron-rebuild: command not found"
```bash
# Use o electron-rebuild local
./node_modules/.bin/electron-rebuild
```

### Problema: Tela branca
```bash
# Recompile o TypeScript
./node_modules/.bin/tsc
npm start
```

### Problema: Erros de dependências nativas
```bash
# Rebuild completo
./node_modules/.bin/electron-rebuild
npm start
```

## 📝 Logs e Debug

### Verificar logs detalhados
```bash
deepnest_debug=1 npm start
```

### Verificar versões
```bash
node --version
npm --version
./node_modules/.bin/tsc --version
```

## 🎯 Status de Sucesso

Quando tudo estiver funcionando, você verá:

```
🎉 Setup do DeepNest concluído!
==================================

Para executar o DeepNest:
   npm start

Para desenvolvimento:
   deepnest_debug=1 npm start

✅ DeepNest está pronto para uso!
```

## 🔄 Reinstalação

Para reinstalar completamente:

```bash
# Limpar tudo
rm -rf node_modules build

# Executar setup novamente
./setup-deepnest.sh
```

## 📞 Suporte

Se encontrar problemas:

1. Verifique se Node.js está instalado
2. Execute o script com debug: `deepnest_debug=1 npm start`
3. Verifique os logs no terminal
4. Tente reinstalar: `rm -rf node_modules build && ./setup-deepnest.sh`

---

**✅ DeepNest está pronto para otimizar seus layouts de corte!** 