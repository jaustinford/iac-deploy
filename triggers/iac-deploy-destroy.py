"""
Run Compose with script-specific arguments
and pause the screen.
"""

import wrappers

wrappers.compose_up("builder", "build")
wrappers.compose_up("destroy", "up --detach")
wrappers.compose_logs("destroy")
wrappers.compose_down("destroy")

input("\nPress [enter] to continue... ")
