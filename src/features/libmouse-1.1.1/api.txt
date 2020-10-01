MikeOS Mouse Library
Version 1.1.0
API Document

Function: mouselib_install_driver
Input: Nothing
Output: Nothing
Description: Initialises the mouse device and installs the mouse driver that handles 
the core library fuctionality. The driver will then continue to run in the background.
This must be run before calling any other mouse functions.

Function: mouselib_locate
Input: Nothing
Output: CX = mouse X; DX = mouse Y
Description: Returns coordinates to the current mouse position. 

Function: mouselib_move
Input: CX = mouse X, DX = mouse Y
Output: Nothing
Description: Assigns the coordinates for a new mouse position.

Function: mouselib_show
Input: Nothing
Output: Nothing
Description: In text mode this inverts the colour of the text character corrosponding
to the mouse position. This should not be used in graphical modes.

Function: mouselib_hide
Input: Nothing
Output: Nothing
Description: Resets a text character after a previous call to mouselib_show.

Function: mouselib_range
Input: 	AX = minimum X; BX = minimum Y
	CX = maximum X; DX = maximum Y
Output: Nothing
Description: Sets the minimum and maximum movement range for the mouse cursor.
In the default 80x25 text mode the values (0, 0, 79, 24) will allow all the screen.
Note that changes will not affect the current position. This must be set initially.

Function: mouselib_wait
Input: Nothing
Output: Nothing
Description: Stops the program until a mouse event is registered by the driver.
This can be mouse movement or a mouse click. Power is conserved by halting the CPU
whilst waiting.

Function: mouselib_anyclick
Input: Nothing
Output: CF = set if any mouse button currently pressed, otherwise cleared
Description: Uses the carry flags to return the status of all mouse buttons.
The carry flag will be set if the left, middle or right mouse button is 
currently pressed or any combination of the previous.

Function: mouselib_leftclick
Input: Nothing
Output: CF = set if left mouse button pressed, otherwise clear

Function: mouselib_rightclick
Input: Nothing
Output: CF = set if left mouse button pressed, otherwise clear

Function: mouselib_middleclick
Input: Nothing
Output: CF = set if left mouse button pressed, otherwise clear
Note that some mice might not have middle buttons.

Function: mouselib_input_wait
Input: Nothing
Output: CF = source, set if keyboard, clear if mouse
Description: Stops the program until either a mouse action or keyboard input
to occurs. If a mouse event occured the carry flags is clear, if keyboard input 
occurred the carry flags is set. The actual input will be collected in neither 
instance, so the program will need to check inputs as per normal.Power is 
conserved by halting the CPU whilst waiting.

Function: mouselib_scale
Input: DL = mouse X scale, DH = mouse Y scale
Output: Nothing
Description: Sets an movement speed of the mouse cursor. This takes the form 
1:2^X, so higher values mean slower.
speeds. 
The maximum rate is (0,0) = 1:1
The recommended text mode value is (2,3)
The recommended graphics mode value is (1,1)
This must be set initially.

Function: mouselib_remove_driver
Input: Nothing
Output: Nothing
Description: Removes the mouse driver. This must be down before exiting the
program or the operating system may lockup.

Function: mouselib_freemove
Input: Nothing
Output: AX = keyboard value
	CX = mouse X; DX = mouse Y
	CF = set if mouse clicked, clear if keyboard input
Description: Pauses the program and displays a mouse cursor on the screen that 
can be moved around by the user. The program is resumed when any mouse click or
keyboard input occurs and the output are set accordingly. This can be useful
for event driven programs.
On a mouse click: AX = 0, CF = clear, CX = mouse X, DX = mouse Y
On keyboard input: AX = key value, CF = set, CX = mouse X, DX = mouse Y

Function: mouselib_setup
Input: Nothing
Output: Nothing
Description: Install the mouse driver and sets default settings for text mode.

Function: mouselib_eventmode_start
Input: Nothing
Output: Nothing
Description: Enters event mode, an event-driven system that detects mouse and
keyboard events and calls event handlers to deal with them if they exist.
Remember to assign event handlers before entering event mode.

Function: mouselib_eventmode_stop
Input: Nothing
Output: Nothing
Description: Stops event mode when all current events have been processed.

Function: mouselib_eventmode_assignhandler
Input: CL = Event ID, AX = address of handler
Output: Nothing
Description: Assigns a handler to be called when the specified event is
generated in event mode.

Function: mouselib_eventmode_releasehandler
Input: CL = Event ID
Output: Nothing
Description: Removes the handler for a specific event. The event will be
ignored if it occurs.

Possible Events Identifiers:
MOUSELIB_EVENT_MOVE --- The mouse has been moved.
MOUSELIB_EVENT_LEFTCLICK --- The left mouse button has been pressed.
MOUSELIB_EVENT_MIDDLECLICK --- The middle mouse button has been pressed.
MOUSELIB_EVENT_RIGHTCLICK --- The right mouse button has been pressed.
MOUSELIB_EVENT_LEFTRELEASE --- The left mouse button has been released.
MOUSELIB_EVENT_MIDDLERELEASE --- The middle mouse button has been released.
MOUSELIB_EVENT_RIGHTRELEASE --- The right mouse button has been released.
MOUSELIB_EVENT_KEYBOARD --- A keyboard key has been pressed. (AX = Key Value)

If multiple, simultaneous events occur they will be processed in the order
respective to that of the list, i.e. "MOVE" events will be processed before
"LEFTCLICK" events.

Constants:
HAS_MOUSE_DRIVER --- Defined when the library is included
MOUSE_DRIVER_VERSION --- Version number of the mouse driver (currently 110)

