#!/bin/bash
# Script para criar estrutura vazia do Next.js com multitenant
# Inclui pastas auth, session, user, admin, public, tenant, layout e globals
# Uso:
# ./init-multitenant.sh           -> cria tenants padrão BR/SP e US/CT
# ./init-multitenant.sh BR SP     -> cria apenas esse tenant
# ./init-multitenant.sh US CT     -> cria apenas esse tenant

echo "Iniciando criação da estrutura vazia com multitenant..."

# Função para criar arquivo vazio
create_file() {
  FILE=$1
  touch "$FILE"
  echo "Criado: $FILE"
}

# 1. Public
mkdir -p src/app/public
create_file src/app/public/page.tsx
create_file src/app/public/header.tsx
create_file src/app/public/footer.tsx

# 2. Auth
mkdir -p src/app/auth
create_file src/app/auth/page.tsx
create_file src/app/auth/signIn.tsx
create_file src/app/auth/signUp.tsx
create_file src/app/auth/resetPassword.tsx
create_file src/app/auth/logout.tsx

# 2.1 Session dentro de auth
mkdir -p src/app/auth/session
create_file src/app/auth/session/session.ts

# 3. User (perfil do usuário)
mkdir -p src/app/user
create_file src/app/user/profile.tsx

# 4. Admin (painel administrativo)
mkdir -p src/app/admin
create_file src/app/admin/dashboard.tsx
create_file src/app/admin/users.tsx

# 5. Layout e globals
create_file src/app/layout.tsx
create_file src/app/globals.css

# 6. Tenant
mkdir -p src/app/tenant

TENANTS=()

# Se passou argumentos, cria apenas o tenant informado
if [ $# -eq 2 ]; then
  TENANTS+=("$1 $2")
else
  # tenants padrão
  TENANTS=("br sp" "us ct")
fi

for t in "${TENANTS[@]}"; do
  PAIS=$(echo $t | cut -d' ' -f1)
  ESTADO=$(echo $t | cut -d' ' -f2)
  DIR="src/app/tenant/${PAIS,,}/${ESTADO,,}"
  mkdir -p $DIR
  create_file $DIR/page.tsx
  create_file $DIR/settings.tsx
done

echo "Estrutura de pastas e arquivos vazios com multitenant criada com sucesso!"



npm install @mui/material @emotion/react @emotion/styled
npm install react-is@18.3.1
npm install @mui/material @mui/styled-engine-sc styled-components
npm install @fontsource/roboto
npm install @mui/icons-material
