**JACart Electronics Repo**

Contain Python and Arduino controller code for managing the Teleop board.

**Repo Contents**

cart_teleop_dac:/ Updated Arduino teleop code that utilizes DACs instead of PWM signals. This version should be the one used going forward.

python_teleop:/ Stand-alone python controller for teleop_board

libs:/ Require libraries for operating the Arudino teleop code

**Known/Active Branches*

message_passing: branch for developing more robust message passing system to ROS from Arduino.

Message format is coma separated ASCII string: CMD, PARAM 1, PARAM 2...PARAM N,CHECKSUM,EOL. CMD is substring where PARAMs are string encoded integers. EOL is \r\n and CHECKSUM = 1024 - (SUM OF ALL PARAMS).

Commands:
	STS: Status message containing current steering pot, latest steering target, throttle target, and break target.