"""
Run Compose with script-specific arguments
and pause the screen.
"""

import wrappers

wrappers.compose_up("builder", "build")
wrappers.compose_up("plan", "up --detach")
wrappers.compose_logs("plan")
wrappers.compose_down("plan")

input("\nPress [enter] to continue... ")
