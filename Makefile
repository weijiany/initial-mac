run: prepare
	ansible-playbook main.yml -i inventory/local -vv --extra-vars "${SUDO_PASSWORD}"

prepare:
	./prepare.sh