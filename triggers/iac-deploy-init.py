"""
Run Compose with script-specific arguments
and pause the screen.
"""

import wrappers

wrappers.compose_up("builder", "build")
wrappers.compose_up("init", "up --detach")
wrappers.compose_logs("init")
wrappers.compose_down("init")

input("\nPress [enter] to continue... ")
