RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
#Início
echo -e "${GREEN}REINICIANDO A SPERO EXCHANGE..."
#Passo 01
echo -e "${BLUE}PASSO 01/04 - MIGRANDO A DATABASE..."
bundle exec rake db:migrate
#Passo 02
echo -e "${BLUE}PASSO 02/04 - LIMPANDO ARQUIVOS TEMPORARIOS..."
bundle exec rake tmp:clear
#Passo 03
echo -e "${BLUE}PASSO 03/04 - PRECOMPILANDO ASSETS..."
bundle exec rake assets:precompile
#Passo 04
echo -e "${BLUE}PASSO 04/04 - REINICIANDO O SERVIDOR NGINX..."
sudo service nginx restart
#Fim
echo -e "${GREEN}OPERACAO CONCLUIDA COM SUCESSO!${NC}"
