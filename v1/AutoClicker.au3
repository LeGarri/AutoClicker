#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile_x64=AutoClicker.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <Misc.au3>



$x = 0
$y = 0
$spaceBarPressed = False
$click = False
$timerUsed = False
$timer = 0



#Region ### START Koda GUI section ### Form=C:\Users\quint\Desktop\AutoIt\AutoClicker\v1\FormAutoClicker.kxf
$FormAutoClicker = GUICreate("Auto Clicker by LeGarri", 295, 121, 313, 204)
$InputCPS = GUICtrlCreateInput("10", 24, 8, 25, 21)
GUICtrlSetBkColor(-1, 0xE3E3E3)
GUICtrlSetState(-1, $GUI_DISABLE)
$LabelCPS = GUICtrlCreateLabel("Click per second", 80, 8, 83, 17)
$LabelStatAutoClicker = GUICtrlCreateLabel("OFF", 8, 80, 36, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, 0xFF0000)
$LabelKeyAutoClicker = GUICtrlCreateLabel("Use ENTER to turn on/off auto clicker", 48, 80, 184, 17)
$InputPosX = GUICtrlCreateInput("0", 24, 40, 25, 21)
GUICtrlSetBkColor(-1, 0xE3E3E3)
GUICtrlSetState(-1, $GUI_DISABLE)
$LabelPosX = GUICtrlCreateLabel("X:", 8, 40, 14, 17)
$LabelPosY = GUICtrlCreateLabel("Y:", 56, 40, 14, 17)
$InputPosY = GUICtrlCreateInput("0", 72, 40, 25, 21)
GUICtrlSetBkColor(-1, 0xE3E3E3)
GUICtrlSetState(-1, $GUI_DISABLE)
$LabelPos = GUICtrlCreateLabel("Use left CTRL to set mouse position", 104, 40, 173, 17)
$ButtonAddCPS = GUICtrlCreateButton("+1", 48, 8, 27, 25)
$ButtonReduceCPS = GUICtrlCreateButton("-1", 0, 8, 27, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
WinSetOnTop($FormAutoClicker, "", 1)



Func SetPos($mouseX, $mouseY)
	$x = $mouseX
	$y = $mouseY

	GUICtrlSetData($InputPosX, $x)
	GUICtrlSetData($InputPosY, $y)
EndFunc

Func AddCPS()
	$cps = Int(GUICtrlRead($InputCPS))

	If $cps < 20 Then
		GUICtrlSetData($InputCPS, $cps+1)
	EndIf
EndFunc

Func ReduceCPS()
	$cps = Int(GUICtrlRead($InputCPS))

	If $cps > 1 Then
		GUICtrlSetData($InputCPS, $cps-1)
	EndIf
EndFunc



While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $ButtonAddCPS
			AddCPS()

		Case $ButtonReduceCPS
			ReduceCPS()
	EndSwitch

	If _IsPressed("11") Then
		SetPos(MouseGetPos()[0], MouseGetPos()[1])
	EndIf

	If _IsPressed("0D") And Not $spaceBarPressed Then
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
		EndIf
	ElseIf $spaceBarPressed And Not _IsPressed("0D") Then
		$spaceBarPressed = False
	EndIf

	If $click Then
		If Not $timerUsed Then
			$timerUsed = True
			$timer = TimerInit()
		Else
			$cps = Int(GUICtrlRead($InputCPS))
			$timeCost = 0

			Switch $cps
				Case 5
					$timeCost = 160

				Case 10
					$timeCost = 55
			EndSwitch

			If TimerDiff($timer) >= $timeCost Then
				$timerUsed = False
				MouseClick($MOUSE_CLICK_PRIMARY, $x, $y)
			EndIf
		EndIf
	EndIf
WEnd



































