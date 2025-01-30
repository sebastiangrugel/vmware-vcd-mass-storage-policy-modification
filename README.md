# Script to Modify Storage Policy on VM Level

VMs are listed in a CSV file.

## Constraints:
- VMs start one by one.
- After 5 minutes, there is a timeout for the task, and the process is visible at the vCenter level.
- The Storage Policy on the VM level is updated to the new Storage Policy name, even if the task at the vCenter level is still running.

## To Do:
- Validate how we can check when the task is completed without access to vCenter. (Assumption: The Storage Policy on the disk level updates when the vCenter task is completed.)
