import jinja2
import jq
import json
import subprocess
import os

__location__ = os.path.realpath(
    os.path.join(os.getcwd(), os.path.dirname(__file__)))

tplLoader = jinja2.FileSystemLoader(searchpath=__location__)
env = jinja2.Environment ( loader=tplLoader)

json_data = json.loads(subprocess.Popen("yc compute instance list --format=json", shell=True, stdout=subprocess.PIPE, text=True).stdout.read())

name = jq.compile(".[] | .name").input(json_data).all()
address = jq.compile(".[] | .network_interfaces[].primary_v4_address.one_to_one_nat.address").input(json_data).all()

host_ip = dict(zip(name, address))

tpl = env.get_template('inventory.j2')
inventory = tpl.stream(data=host_ip)

inventory.dump(os.path.join(__location__, "hosts_auto.ini"))
