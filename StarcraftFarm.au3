#include <AutoItConstants.au3>


HotKeySet("{END}", "quit")
HotKeySet("{Home}", "start")
HotKeySet("{TAB}", "pozitie")
HotKeySet("{F2}", "showChecks")
HotKeySet("{F3}", "pauseZ")


Global $Xx = 1970
Global $Yy = 0
Global $mX = 0
Global $mY = 0
Global $race = 0


While 1
   Sleep(1000)
WEnd


Func start()
	SetDelay()

    ;;; Click Play Button
    Click_Play()
EndFunc


Func pauseZ()
   While 1
	  Sleep(2000)
   WEnd
EndFunc


Func quit()
   Exit 0
EndFunc


Func pozitie()
	Local $aPos = MouseGetPos()
	ToolTip('X: ' & $aPos[0] - $Xx & ', Y: ' & $aPos[1] - $Yy)
EndFunc


Func SetDelay()
   ;;;; Set Delay
   AutoItSetOption("MouseClickDelay", 50)
   AutoItSetOption("MouseClickDownDelay", 50)
EndFunc


Func showChecks()
	Local $check = PixelChecksum($Xx + 20, $Yy + 745, $Xx + 45, $Yy + 760)
	ToolTip($check)
EndFunc


Func Click_Play()
    Care_Promo()

	$race = 0
	MouseClick("left", $Xx + 410, $Yy + 850, 2, 0)
	Sleep(500)

	;;; Check Worker Sign and return race
	Check_for_Game()
EndFunc


Func Care_Promo()
   MouseClick("left", $Xx + 900, $Yy + 945, 1, 0)
   Sleep(3000)
EndFunc


Func Check_for_Game()
	Local $check = 0
	Local $valuee = 0

	While 1
		$check = PixelChecksum($Xx + 20, $Yy + 745, $Xx + 45, $Yy + 760)

		If $check = 3539682599 Then
			$race = 1					;;; zerg
			Play_a_Bit()
		EndIf

		If $check = 3591630717 Then
			$race = 2					;;; terran
			Play_a_Bit()
		EndIf

		If $check = 3501434946 Then
			$race = 3					;;; toss
			Play_a_Bit()
		 EndIf

	  $valuee = $valuee + 1
	  Sleep(1000)

	  If $valuee > 90 Then
		Click_Play()
	  EndIf
	WEnd
EndFunc


Func Zerg_Make_Drone()
   ;;; Click Middle Screen Base
   Send("0")
   Sleep(500)

   Send("{s}")
   Sleep(500)
   Send("{d}")
   Sleep(12000)
EndFunc


Func Terran_Make_SCV()
   ;;; Click Middle Screen Base
   Send("0")
   Sleep(500)

   Send("{s}")
   Sleep(12000)
EndFunc


Func Protoss_Make_Probe()
   ;;; Click Middle Screen Base
   Send("0")
   Sleep(500)

   Send("{e}")
   Sleep(12000)
EndFunc


Func Zerg_Make_Drone_Scouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Click Middle Screen
   Send("0")
   Sleep(500)

   Send("{s}")
   Sleep(500)
   Send("{d}")
   Sleep(12000)

   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  Sleep(50)
   Next

   Send("{SHIFTUP}")
   Sleep(500)
EndFunc


Func Terran_Make_SCV_Scouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Click Middle Screen
   Send("0")
   Sleep(500)

   Send("{s}")
   Sleep(12000)

   ;;;; Select all SCVS
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(2000)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   Sleep(500)

   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  Sleep(50)
   Next

   Send("{SHIFTUP}")
   Sleep(500)
EndFunc


Func Protoss_Make_Probe_Scouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Click Middle Screen
   Send("0")
   Sleep(500)

   Send("{e}")
   Sleep(12000)

   ;;;; Select all probes
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(2000)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   Sleep(500)

   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  Sleep(50)
   Next

   Send("{SHIFTUP}")
   Sleep(500)
EndFunc


Func Zerg_Make_Ovie()
   ;;; Click Middle Screen
   Send("0")
   Sleep(500)

   Send("{s}")
   Sleep(500)
   Send("{v}")
   Sleep(6000)
EndFunc


Func Terran_Make_SupplyScout()
   Local $rX = 0
   Local $rY = 0

   ;;; Click Middle Screen
   Send("0")
   Sleep(500)

   Send("{s}")
   Sleep(12000)

   ;;; Select workers
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(2000)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   Sleep(500)

   ;;; Put it on 9
   Send("^9")
   Sleep(500)

   ;;; Build Depot
   Send("{b}")
   Sleep(500)
   Send("{s}")
   Sleep(500)

   ;;; Select a place for it
   For $i=1 To 10 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  Sleep(500)
   Next

   ;;; One press 9
   Send("9")
   Sleep(500)

   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  Sleep(50)
   Next

   Send("{SHIFTUP}")
   Sleep(500)
EndFunc


Func Protoss_Make_PylonScout()
   Local $rX = 0
   Local $rY = 0

   ;;; Click Middle Screen
   Send("0")
   Sleep(500)

   Send("{e}")
   Sleep(12000)

   ;;; Select workers
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(2000)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   Sleep(500)

   ;;; Put it on 9
   Send("^9")
   Sleep(500)

   ;;; Build Depot
   Send("{b}")
   Sleep(500)
   Send("{e}")
   Sleep(500)

   ;;; Select a place for it
   For $i=1 To 10 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  Sleep(500)
   Next

   ;;; One press 9
   Send("9")
   Sleep(500)

   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  Sleep(50)
   Next

   Send("{SHIFTUP}")
   Sleep(500)
EndFunc


Func Play_a_Bit()
   Sleep(5000)

	If $race = 1 Then
	  CenterZ()
	  Zerg_Make_Drone()
	  Zerg_Make_Ovie()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone_Scouter()
	  Zerg_Make_Drone_Scouter()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone()
	  Zerg_Make_Ovie()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone_Scouter()
	  Zerg_Make_Drone_Scouter()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone_Scouter()
	  Zerg_Make_Drone_Scouter()
	  Zerg_Make_Drone()
	  Zerg_Make_Drone_Scouter()
	  Zerg_Make_Drone_Scouter()
	  Sleep(1000 * Random(0, 15, 1))
	EndIf

	If $race = 2 Then
	  CenterT()
	  Terran_Make_SCV()
	  Terran_Make_SCV()
	  Terran_Make_SupplyScout()
	  Terran_Make_SCV()
	  Terran_Make_SCV()
	  Terran_Make_SCV_Scouter()
	  Terran_Make_SCV()
	  Terran_Make_SCV()
	  Terran_Make_SupplyScout()
	  Terran_Make_SCV_Scouter()
	  Terran_Make_SCV()
	  Terran_Make_SCV()
	  Terran_Make_SCV_Scouter()
	  Terran_Make_SCV_Scouter()
	  Terran_Make_SCV()
	  Terran_Make_SCV()
	  Terran_Make_SCV_Scouter()
	  Sleep(1000 * Random(0, 20, 1))
	EndIf

	If $race = 3 Then
	  CenterP()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe()
	  Protoss_Make_PylonScout()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe_Scouter()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe()
	  Protoss_Make_PylonScout()
	  Protoss_Make_Probe_Scouter()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe_Scouter()
	  Protoss_Make_Probe_Scouter()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe()
	  Protoss_Make_Probe_Scouter()
	  Sleep(1000 * Random(0, 20, 1))
	EndIf

	End_Game()
EndFunc


Func CenterT()
   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   Send("{SHIFTUP}")
   Sleep(500)

   ;;; Click CC
   MouseClick("left", $Xx + 870, $Yy + 940, 1, 0)
   Sleep(500)

   ;;; Put on 0
   Send("^0")
   Sleep(500)

   ;;; Double press 0
   ;;; Center
   Send("0")
   Send("0")
   Sleep(500)
EndFunc


Func CenterP()
   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   Send("{SHIFTUP}")
   Sleep(500)

   ;;; Click CC
   MouseClick("left", $Xx + 870, $Yy + 940, 1, 0)
   Sleep(500)

   ;;; Put on 0
   Send("^0")
   Sleep(500)

   ;;; Double press 0
   ;;; Center
   Send("0")
   Send("0")
   Sleep(500)
EndFunc


Func CenterZ()
   Send("{SHIFTDOWN}")
   Sleep(200)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   Sleep(1000)

   Send("{SHIFTUP}")
   Sleep(500)

   ;;; Click CC
   MouseClick("left", $Xx + 655, $Yy + 990, 1, 0)
   Sleep(500)

   ;;; Put on 0
   Send("^0")
   Sleep(500)

   ;;; Double press 0
   ;;; Center
   Send("0")
   Send("0")
   Sleep(500)
EndFunc


Func End_Game()
    ;;;; Select Game Window
    Send("0")
    Sleep(500)

	;;; case is already done
    Send("{s}")
    Sleep(500)

	Send("{F10}")
	Sleep(500)
	Send("{n}")

	;;; Wait loading screen
	Sleep(10000)

	;;; Go again
	Click_Play()
EndFunc