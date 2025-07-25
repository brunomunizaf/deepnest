# 🚀 DeepNest - Setup Rápido

## 📋 Pré-requisitos
- Node.js (versão 16+)
- npm

## 🎯 Setup Automatizado

### Linux/macOS
```bash
chmod +x setup-deepnest.sh
./setup-deepnest.sh
```

### Windows
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup-deepnest.ps1
```

## 🔧 Setup Manual

```bash
# 1. Instalar dependências
npm install

# 2. Compilar TypeScript
./node_modules/.bin/tsc

# 3. Rebuild dependências nativas
./node_modules/.bin/electron-rebuild

# 4. Executar
npm start
```

## 🎮 Comandos Úteis

```bash
# Execução normal
npm start

# Modo debug
deepnest_debug=1 npm start

# Build de distribuição
npm run dist
```

## ⚠️ Problemas Comuns

### Tela branca
```bash
./node_modules/.bin/tsc
npm start
```

### Erros de dependências
```bash
./node_modules/.bin/electron-rebuild
npm start
```

## ✅ Status de Sucesso
- ✅ Dependências instaladas
- ✅ TypeScript compilado
- ✅ Build criado
- ✅ Aplicativo inicia

---

**🎉 DeepNest pronto para uso!** 