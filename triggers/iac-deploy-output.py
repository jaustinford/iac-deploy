"""
Run Compose with script-specific arguments
and pause the screen.
"""

import wrappers

wrappers.compose_up("builder", "build")
wrappers.compose_up("output", "up --detach")
wrappers.compose_logs("output")
wrappers.compose_down("output")

input("\nPress [enter] to continue... ")
