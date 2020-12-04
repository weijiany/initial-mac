run: prepare
	ansible-playbook main.yml -i inventory/local --extra-vars "${SUDO_PASSWORD}"

prepare:
	./prepare.sh