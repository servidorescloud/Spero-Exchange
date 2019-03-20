RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
#Início
echo -e "${GREEN}REINICIANDO A SPERO EXCHANGE..."
#Passo 01
echo -e "${BLUE}PASSO 01/05 - MIGRANDO A DATABASE..."
bundle exec rake db:migrate
#Passo 02
echo -e "${BLUE}PASSO 02/05 - LIMPANDO ARQUIVOS TEMPORARIOS..."
bundle exec rake tmp:clear
#Passo 03
echo -e "${BLUE}PASSO 03/05 - PRECOMPILANDO ASSETS..."
bundle exec rake assets:precompile
#Passo 04
echo -e "${BLUE}PASSO 04/05 - REINICIANDO DAEMONS..."
#Daemons
# stop
clear
echo -e "${RED}PARANDO DAEMON: ${NC}matching..."
bundle exec rake daemon:matching:stop
echo -e "${RED}PARANDO DAEMON: ${NC} withdraw_coin..."
bundle exec rake daemon:withdraw_coin:stop
echo -e "${RED}PARANDO DAEMON: ${NC} notification..."
bundle exec rake daemon:notification:stop
echo -e "${RED}PARANDO DAEMON: ${NC} withdraw_audit..."
bundle exec rake daemon:withdraw_audit:stop
echo -e "${RED}PARANDO DAEMON: ${NC} market_data..."
bundle exec rake daemon:market_data:stop
echo -e "${RED}PARANDO DAEMON: ${NC} hot_wallets..."
bundle exec rake daemon:hot_wallets:stop
echo -e "${RED}PARANDO DAEMON: ${NC} payment_transaction..."
bundle exec rake daemon:payment_transaction:stop
echo -e "${RED}PARANDO DAEMON: ${NC} k..."
bundle exec rake daemon:k:stop
echo -e "${RED}PARANDO DAEMON: ${NC} websocket_api..."
bundle exec rake daemon:websocket_api:stop
echo -e "${RED}PARANDO DAEMON: ${NC} stats..."
bundle exec rake daemon:stats:stop
echo -e "${RED}PARANDO DAEMON: ${NC} pusher..."
bundle exec rake daemon:pusher:stop
echo -e "${RED}PARANDO DAEMON: ${NC} global_state..."
bundle exec rake daemon:global_state:stop
echo -e "${RED}PARANDO DAEMON: ${NC} currencies_stats..."
bundle exec rake daemon:currencies_stats:stop

echo -e "${RED}PARANDO ${NC}TRADE_EXECUTOR=5..."
bundle exec rake TRADE_EXECUTOR=5 daemon:trade_executor:stop
echo -e "${RED}PARANDO ${NC}DEPOSIT_COIN_ADDRESS=4..."
bundle exec rake DEPOSIT_COIN_ADDRESS=4 daemon:deposit_coin_address:stop
echo -e "${RED}PARANDO ${NC}ORDER_PROCESSOR=5..."
bundle exec rake ORDER_PROCESSOR=5 daemon:order_processor:stop

echo -e "${RED}PARANDO ${NC}DEPOSIT_COIN=5..."
bundle exec rake DEPOSIT_COIN=5 daemon:deposit_coin:stop
# start
echo -e "${YELLOW}INICIANDO ${NC}DEPOSIT_COIN=5..."
bundle exec rake DEPOSIT_COIN=5 daemon:deposit_coin:start

echo -e "${YELLOW}INICIANDO DAEMON: ${NC} matching..."
bundle exec rake daemon:matching:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} withdraw_coin..."
bundle exec rake daemon:withdraw_coin:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} notification..."
bundle exec rake daemon:notification:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} withdraw_audit..."
bundle exec rake daemon:withdraw_audit:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} market_data..."
bundle exec rake daemon:market_data:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} hot_wallets..."
bundle exec rake daemon:hot_wallets:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} payment_transaction..."
bundle exec rake daemon:payment_transaction:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} k..."
bundle exec rake daemon:k:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} websocket_api..."
bundle exec rake daemon:websocket_api:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} stats..."
bundle exec rake daemon:stats:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} pusher..."
bundle exec rake daemon:pusher:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} global_state..."
bundle exec rake daemon:global_state:start
echo -e "${YELLOW}INICIANDO DAEMON: ${NC} currencies_stats..."
bundle exec rake daemon:currencies_stats:start

echo -e "${YELLOW}INICIANDO ${NC}TRADE_EXECUTOR=5..."
bundle exec rake TRADE_EXECUTOR=5 daemon:trade_executor:start
echo -e "${YELLOW}INICIANDO ${NC}DEPOSIT_COIN_ADDRESS=4..."
bundle exec rake DEPOSIT_COIN_ADDRESS=4 daemon:deposit_coin_address:start
echo -e "${YELLOW}INICIANDO ${NC}ORDER_PROCESSOR=5..."
bundle exec rake ORDER_PROCESSOR=5 daemon:order_processor:start
#Passo 05
echo -e "${BLUE}PASSO 05/05 - REINICIANDO O SERVIDOR NGINX..."
sudo service nginx restart
#Fim
echo -e "${GREEN}OPERACAO CONCLUIDA COM SUCESSO!${NC}"
