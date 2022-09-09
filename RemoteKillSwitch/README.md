Sub-folder for Remote Kill Switch Implementation.

System is two boards connected via Xbee radios. User (Itsy 32u4 @ 3V) and Cart (Arduino UNO @ 5V).

User radio will constantly transmit ASCII character '1' or '0' to indicate whether the JACart should RUN or KILL. '1' indicates RUN and '0' indicates KILL.

Network parameters are:

PAN ID: 0xABC

Channel: 16 (fixed by firmware)

User Radio MY: 0x (fixed by firmware)
User Radio NI: USER
User Radio DH: 0x13A200
User Radio DL: 0x406985D5 (such that will direct transmit to Cart)

Cart Radio MY: 0x738B (fixed by firmware)
Cart Radio NI: CART
Cart Radio DH: 0x0
Cart Radio DL: 0xFFFF (messages will be broadcast)

**Legacy radio firmware must be installed in XCTU to recognize the radio**

<img src = "kill-switch-fsm.png" />

TODO:
- Current logic is overly complex. Delete the TIMEOUT state and valid/invalid packet signals. Add timeout login into both RUN and KILL states.