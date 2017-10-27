# playbooks for setting up a ceph test cluster

On localhost, run `ansible-playbook 1-create_instances.yml`
- Creates 1 control (/pet) node.
- Creates 2x3 osd/mon (/cattle) nodes.
- Creates hosts file for internal DNS based on os_server return data.
- Creates inventory for [pet] based on os_server return data.

On localhost, run `ansible-playbook -i inventory 2-config_pet.yml`
- Connects to control node via inventory created in #1.
- Copies local hosts file.
- Copies ansible playbook to control node for further setup of cattle nodes.
- Sets up iptables NAT'ing on pet.

On pet node, run `ansible-playbook cluster_internal/init_nodes.yml`
- Runs ansible from pet node and configures cattle nodes.
- Configures routing via pet on all cattle nodes.
