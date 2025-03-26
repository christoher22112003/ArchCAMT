# Cleanup Notes

## Optimized Script Execution

### Title: Modularized Script Execution
**Description:** The script execution process in `main.sh` has been modularized using a function (`execute_scripts`). This ensures better readability and maintainability while preserving the specific order of execution. Additionally, the output is now color-coded:
- **Green:** Indicates successful execution of a script.
- **Red:** Indicates an error during execution.

### Changes:
1. Added a function `execute_scripts` to handle the execution of installation scripts.
2. Ensured that the order of execution remains unchanged.
3. Improved logging with color-coded messages for better visibility.
