setup-vpn-server:
	docker-compose -f vpn.docker-compose.yml up -d vpn-server

serve-vpn-config:
	docker-compose -f vpn.docker-compose.yml up -d vpn-serve-config
