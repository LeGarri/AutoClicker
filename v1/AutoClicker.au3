#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <Misc.au3>


$x = 0
$y = 0
$spaceBarPressed = False;
$click = True
$timerUsed = False
$timer = 0

;TODO: fix bug at launch
#Region ### START Koda GUI section ### Form=C:\Users\quint\Desktop\AutoIt\AutoClicker\v0\FormAutoClicker.kxf
$FormAutoClicker = GUICreate("Auto Clicker", 295, 121, 313, 204)
$InputCPS = GUICtrlCreateInput("0", 8, 8, 25, 21, $ES_NUMBER)
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
$LabelPos = GUICtrlCreateLabel("Use CTRL to set mouse position", 104, 40, 173, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



Func SetPos($mouseX, $mouseY)
	$x = $mouseX
	$y = $mouseY

	GUICtrlSetData($InputPosX, $x)
	GUICtrlSetData($InputPosY, $y)
EndFunc



While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $InputCPS
	EndSwitch

	If _IsPressed("11") Then
		SetPos(MouseGetPos()[0], MouseGetPos()[1])
	EndIf

	If _IsPressed("20") And Not $spaceBarPressed Then
		If $click Then
			$spaceBarPressed = True
			$click = False
			GUICtrlSetData($LabelStatAutoClicker, "OFF")
			GUICtrlSetBkColor($LabelStatAutoClicker, $COLOR_RED)
		Else
			$spaceBarPressed = True
			$click = True
			GUICtrlSetData($LabelStatAutoClicker, "ON")
			GUICtrlSetBkColor($LabelStatAutoClicker, $COLOR_GREEN)
			MouseMove($x, $y)
		EndIf
	ElseIf $spaceBarPressed And Not _IsPressed("20") Then
		$spaceBarPressed = False
	EndIf

	If $click Then
		If Not $timerUsed Then
			$timerUsed = True
			$timer = TimerInit()
		ElseIf TimerDiff($timer) >= (1000 / $InputCPS) Then
			$timerUsed = False
			MouseClick($MOUSE_CLICK_PRIMARY)
		EndIf
	EndIf
WEnd



































