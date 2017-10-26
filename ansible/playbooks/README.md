Step #1
- Creates 1 control (/pet) node.
- Creates 2x3 osd/mon (/cattle) nodes.
- Creates hosts file for internal DNS based on os_server return data.
- Creates inventory for [pet] based on os_server return data.

Step #2 
- Connects to control node via inventory created in #1.
- Copies local hosts file.
- Copies ansible playbook to control node for further setup of cattle nodes.
- Sets up NAT.

Step #3
- Runs ansible from pet node and configures cattle nodes.
- Configures routing via pet on all cattle nodes.
