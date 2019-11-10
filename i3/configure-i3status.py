#!/usr/bin/env python3
from argparse import ArgumentParser
import os

if __name__ == "__main__":
    parser = ArgumentParser("Coverts my i3status configuration template to an actual configuration for this computer.")
    parser.add_argument("configuration_template")
    parser.add_argument("destination", nargs="?")

    args = parser.parse_args()

    with open(args.configuration_template) as config_file:
        config_template = config_file.read()

    cpu_temperature_modules = ""
    cpu_temperature_orders = ""
    num_hardware_temperatures = 1
    while os.path.exists("/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp{}_input".format(num_hardware_temperatures)):
        cpu_temperature_orders += 'order += "cpu_temperature {}"\n'.format(num_hardware_temperatures)
        cpu_temperature_modules += '''
cpu_temperature 0 {{
        format = "%degrees°C"
        path = "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp{}_input"
}}
'''.format(num_hardware_temperatures)
        num_hardware_temperatures += 1

    config = config_template.format(
            cpu_temperature_orders=cpu_temperature_orders,
            cpu_temperature_modules=cpu_temperature_modules
    )

    if args.destination:
        with open(args.destination, 'w') as config_file:
            config_file.write(config)
    else:
        print(config)

