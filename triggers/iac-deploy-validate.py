"""
Run Compose with script-specific arguments
and pause the screen.
"""

import wrappers

wrappers.compose_up("builder", "build")
wrappers.compose_up("validate", "up --detach")
wrappers.compose_logs("validate")
wrappers.compose_down("validate")

input("\nPress [enter] to continue... ")
