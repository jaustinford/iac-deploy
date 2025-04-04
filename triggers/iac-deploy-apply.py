"""
Run Compose with script-specific arguments
and pause the screen.
"""

import wrappers

wrappers.compose_up("builder", "build")
wrappers.compose_up("apply", "up --detach")
wrappers.compose_logs("apply")
wrappers.compose_down("apply")

input("\nPress [enter] to continue... ")
