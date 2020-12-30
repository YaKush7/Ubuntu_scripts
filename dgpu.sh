#!/bin/bash

# to execete program with nvidia gpu
# when prime profile is set to --> NVIDIA ON DEMAND

# set up as described in
# https://www.reddit.com/r/linux_gaming/comments/aoh5be/guide_hybrid_graphics_on_linux_nvidia_optimus/
# for nvidia gpu

helpFunction()
{
   echo ""
   echo "Usage: bash dgpu.sh [Name of program]"
   echo "EXAMPLE:"
   echo -e "\tdgpu glxheads :0"
   echo ""
   exit 1
}

# runs program with nvidia gpu
execute()
{
    __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia $1
}

# main
RUN="$*"
if [ -z "$RUN" ]; then
    helpFunction
else
    execute $RUN
fi
