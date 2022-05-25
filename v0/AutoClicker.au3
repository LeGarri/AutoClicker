#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>



#Region ### START Koda GUI section ### Form=C:\Users\quint\Desktop\AutoIt\AutoClicker\v0\FormAutoClicker.kxf
$FormAutoClicker = GUICreate("Auto Clicker", 295, 121, 313, 204)
$InputCPS = GUICtrlCreateInput("0", 8, 8, 25, 21)
$LabelCPS = GUICtrlCreateLabel("Click per second", 40, 8, 83, 17)
$LabelStatAutoClicker = GUICtrlCreateLabel("OFF", 8, 80, 36, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, 0xFF0000)
$LabelKeyAutoClicker = GUICtrlCreateLabel("Use SPACE to turn on/off auto clicker", 48, 80, 184, 17)
$InputPosX = GUICtrlCreateInput("0", 24, 40, 25, 21)
GUICtrlSetBkColor(-1, 0xE3E3E3)
GUICtrlSetState(-1, $GUI_DISABLE)
$LabelPosX = GUICtrlCreateLabel("X:", 8, 40, 14, 17)
$LabelPosY = GUICtrlCreateLabel("Y:", 56, 40, 14, 17)
$InputPosY = GUICtrlCreateInput("0", 72, 40, 25, 21)
GUICtrlSetBkColor(-1, 0xE3E3E3)
GUICtrlSetState(-1, $GUI_DISABLE)
$Label1 = GUICtrlCreateLabel("Use left CTRL to set mouse position", 104, 40, 173, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $InputCPS
	EndSwitch
WEnd
