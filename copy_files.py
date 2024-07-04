import os


def extract_commands(file_content):
    compile_commands = []
    run_commands = []

    in_compile_section = False
    in_run_section = False

    for line in file_content.split("\n"):
        if "# Copied from .codecrafters/compile.sh" in line:
            in_compile_section = True
            in_run_section = False
            continue
        elif "# Copied from .codecrafters/run.sh" in line:
            in_compile_section = False
            in_run_section = True
            continue
        elif line.startswith("exec "):
            in_compile_section = False

        if in_compile_section and line.strip() and not line.startswith("#"):
            compile_commands.append(line)
        elif in_run_section and line.strip() and not line.startswith("#"):
            run_commands.append(line)

    return compile_commands, run_commands


compile_header = """#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
# 
# This runs before .codecrafters/run.sh
#
# Learn more: <insert-link>

"""

run_header = """#!/bin/sh
#
# This script is used to run your program on CodeCrafters
# 
# This runs after .codecrafters/compile.sh
#
# Learn more: <insert-link>

"""

# Read the content of your_program.sh
with open("your_program.sh", "r") as original_file:
    original_script = original_file.read()

compile_commands, run_commands = extract_commands(original_script)

# Ensure the .codecrafters directory exists
os.makedirs(".codecrafters", exist_ok=True)

# Write compile commands to .codecrafters/compile.sh with header
with open(".codecrafters/compile.sh", "w") as compile_file:
    compile_file.write(compile_header)
    for command in compile_commands:
        compile_file.write(command + "\n")

# Write run commands to .codecrafters/run.sh with header
with open(".codecrafters/run.sh", "w") as run_file:
    run_file.write(run_header)
    for command in run_commands:
        run_file.write(command + "\n")

# Add executable permissions
os.chmod(".codecrafters/compile.sh", 0o755)
os.chmod(".codecrafters/run.sh", 0o755)

print(
    "Extraction complete. Check .codecrafters/compile.sh and .codecrafters/run.sh for the results."
)
