#include <AutoItConstants.au3>
#include <Date.au3>


HotKeySet("{END}", "quit")
HotKeySet("{Home}", "Start")
HotKeySet("{TAB}", "pozitie")
HotKeySet("{F2}", "showChecks")
HotKeySet("{F3}", "pauseZ")

Global $last_time = 0
Global $current_time = 0

Global $Xx = 1970
Global $Yy = 0
Global $mX = 0
Global $mY = 0
Global $race = 0
Global $playb = 0

While 1
   WSleep(1200)
WEnd


Func WSleep($value)
   SetDelay()
   Sleep(Random($value*2/3, $value, 1))
EndFunc


Func WRand($value)
   Return Random($value/2, $value, 1)
EndFunc


Func pauseZ()
   While 1
	  WSleep(2400)
   WEnd
EndFunc


Func quit()
   Beep(500, 500)
   Exit 0
EndFunc


Func pozitie()
	Local $aPos = MouseGetPos()
	ToolTip('X: ' & $aPos[0] - $Xx & ', Y: ' & $aPos[1] - $Yy)
EndFunc


Func showChecks()
	Local $check = PixelChecksum($Xx + 20, $Yy + 745, $Xx + 45, $Yy + 760)
	ToolTip($check)
 EndFunc


Func SetDelay()
   ;;;; Set Delay
   AutoItSetOption("MouseClickDelay", WRand(100))
   AutoItSetOption("MouseClickDownDelay", WRand(100))
EndFunc


Func SayGlHf()
	Send("{ENTER}")
	WSleep(300)

	Send("gl hf")
	WSleep(300)

	Send("{ENTER}")
	WSleep(300)

	Send("{ENTER}")
	WSleep(300)

	Send("WCS live")
	WSleep(300)

	Send("{ENTER}")
	WSleep(300)

	Send("{ENTER}")
	WSleep(300)

	Send("twitch.tv/starcraft :D")
	WSleep(300)

	Send("{ENTER}")
	WSleep(300)
EndFunc


Func Start()
	SetDelay()

	$current_time = _Date_Time_GetTickCount()
	$last_time = _Date_Time_GetTickCount()

    ;;; Click Play Button
    Click_Play()
 EndFunc


Func Click_Play()
    $current_time = _Date_Time_GetTickCount()
	If Int(($current_time - $last_time) / 1000) > 1800 Then
	  While 1
		 SoundPlay(@WindowsDir & "\media\Ring05.wav", 1)
		 Sleep(1000)
	  WEnd
    EndIf

    Care_Promo()

	$race = 0
	MouseClick("left", $Xx + 410, $Yy + 850, 2, 0)
	WSleep(600)

	If $playb = 0 Then
		MouseClick("left", $Xx + 215, $Yy + 920, 2, 0)
		WSleep(600)
	EndIf

	;;; Check Worker Sign and return race
	Check_for_Game()
EndFunc


Func Care_Promo()
   MouseClick("left", $Xx + 900, $Yy + 945, 1, 0)
   WSleep(4200)
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
	  WSleep(1200)

	  If $valuee > 45 Then
		Click_Play()
	  EndIf
	WEnd
EndFunc


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Probes / Drones / Scvs ;;;;
;;;; ;;;;;;;;;;;;;;;;;;;;;; ;;;;

Func Zerg_Make_Drone()
   ;;; Select Base Base
   Send("0")
   WSleep(600)

   Send("{s}")
   WSleep(600)
   Send("{d}")
   WSleep(600)
EndFunc


Func Terran_Make_SCV()
   ;;; Select Base Base
   Send("0")
   WSleep(600)

   Send("{s}")
   WSleep(600)
EndFunc


Func Protoss_Make_Probe()
   ;;; Select Base Base
   Send("0")
   WSleep(600)

   Send("{e}")
   WSleep(600)
EndFunc


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Probes / Drones / Scvs - scout ;;;;
;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;

Func Zerg_Make_Drone_Scouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Select Base
   Send("0")
   WSleep(600)

   Send("{s}")
   WSleep(600)
   Send("{d}")
   Sleep(12500)

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(60)
   Next

   Send("{SHIFTUP}")
   WSleep(600)
EndFunc


Func Zerg_Make_Ovie_Scouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Select Base
   Send("0")
   WSleep(600)

   Send("{s}")
   WSleep(600)
   Send("{v}")
   Sleep(18500)

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(60)
   Next

   Send("{SHIFTUP}")
   WSleep(600)
EndFunc


Func Zerg_Make_Zergs_Scouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Select Base
   Send("0")
   WSleep(600)

   Send("{s}")
   WSleep(600)
   Send("{z}")
   Sleep(17500)

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(60)
   Next

   Send("{SHIFTUP}")
   WSleep(600)
EndFunc


Func Terran_Make_SupplyScouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Select workers
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(2400)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   WSleep(600)

   ;;; Put it on 9
   Send("^9")
   WSleep(600)

   ;;; Build Depot
   Send("{b}")
   WSleep(600)
   Send("{s}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 10 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(600)
   Next

   Sleep(20000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   ;;; Build Depot
   Send("{b}")
   WSleep(600)
   Send("{s}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 10 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(600)
   Next

   Sleep(20000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(60)
   Next

   Send("{SHIFTUP}")
   WSleep(600)
EndFunc


Func Protoss_Make_PylonScout()
   Local $rX = 0
   Local $rY = 0

   ;;; Select workers
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(2400)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   WSleep(600)

   ;;; Put it on 9
   Send("^9")
   WSleep(600)

   ;;; Build Pylon
   Send("{b}")
   WSleep(600)
   Send("{e}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 15 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   WSleep(9000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   ;;; Build Pylon
   Send("{b}")
   WSleep(600)
   Send("{e}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 15 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   WSleep(9000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   ;;; Build Pylon
   Send("{b}")
   WSleep(600)
   Send("{e}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 15 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   WSleep(9000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   ;;; Build Pylon
   Send("{b}")
   WSleep(600)
   Send("{e}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 15 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   WSleep(9000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(60)
   Next

   Send("{SHIFTUP}")
   WSleep(600)
EndFunc


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Send First Ovie Scouter ;;;;
;;;; ;;;;;;;;;;;;;;;;;;;;;;; ;;;;

Func Zerg_Send_First_Ovie_Scouter()
   Local $rX = 0
   Local $rY = 0

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(1200)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(1200)

   ;;; Select All
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(1200)

   Send("{SHIFTUP}")
   WSleep(600)

   ;;; Click Ovie
   MouseClick("left", $Xx + 670, $Yy + 880, 1, 0)
   WSleep(600)

   ;;; Put on 8
   Send("^8")
   WSleep(600)

   ;;; One press 8
   Send("8")
   WSleep(600)

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(60)
   Next

   Send("{SHIFTUP}")
   WSleep(600)
EndFunc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Make Buildings / Units ;;;;
;;;; ;;;;;;;;;;;;;;;;;;;;;; ;;;;

Func Zerg_Make_Pool()
   ;;; Select workers
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(2400)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   WSleep(600)

   ;;; Put it on 9
   Send("^9")
   WSleep(600)

   ;;; Build Pool
   Send("{b}")
   WSleep(600)
   Send("{s}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 30 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(360)
   Next
EndFunc


Func Terran_Make_Barracks_Scouter()
   Local $rX = 0
   Local $rY = 0

   ;;; Select workers
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(2400)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   WSleep(600)

   ;;; Select worker builder
   Send("^9")
   WSleep(600)

   ;;; Build Baracks
   Send("{b}")
   WSleep(600)
   Send("{b}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 20 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   Sleep(42000)

   ;;; One press 9
   Send("9")
   WSleep(600)

    ;;; Build Baracks
   Send("{b}")
   WSleep(600)
   Send("{b}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 20 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   Sleep(20000)
   Terran_Make_Orbital()
   Sleep(20000)

   ;;; One press 9
   Send("9")
   WSleep(600)

    ;;; Build Baracks
   Send("{b}")
   WSleep(600)
   Send("{b}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 20 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   Sleep(42000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   ;;; Build Baracks
   Send("{b}")
   WSleep(600)
   Send("{b}")
   WSleep(600)

   ;;; Select a place for it
   For $i=1 To 20 Step +1
	  $rX = Random(170, 1640, 1)
	  $rY = Random(120, 675, 1)
	  MouseClick("left", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(450)
   Next

   Sleep(24000)

   ;;; One press 9
   Send("9")
   WSleep(600)

   Send("{SHIFTDOWN}")
   WSleep(300)

   ;;; Scouter
   For $i=1 To 32 Step +1
	  $rX = Random(35, 275, 1)
	  $rY = Random(790, 1020, 1)
	  MouseClick("right", $Xx + $rX, $Yy + $rY, 1, 0)
	  WSleep(60)
   Next

   Send("{SHIFTUP}")
   WSleep(600)
EndFunc


Func Protoss_Make_Gates()
   Local $rX = 0
   Local $rY = 0

   ;;; Select workers
   MouseClickDrag($MOUSE_CLICK_LEFT, $Xx + 35, $Yy + 35, $Xx + 1765, $Yy + 745, 1)
   WSleep(2400)

   ;;; Select first one
   MouseClick("left", $Xx + 820, $Yy + 885, 1, 0)
   WSleep(600)

   ;;; Select w�!�O���i��S�UW�b�]�?y��.Z2��nr��=.�����"O&��د�CT�E��7������pӬ�!D��K�>y�*8E5]��A_��i��-U�[������GH���T^IWLm�+��;qR>x�ʰýy�U$�$��Bŀ��%���T��zճԜ�4�,؅t
��B�Gn�IFM�5���y�b��	����,�������sI��䙴Z�-��|qO�K�m�.%�{���]=w�a%�<����H��3������?��j���{E Y_ �N�vH�[�8��u-��N+��d���b]�Q1�?�l|
�Ӡt����k�#ߵ`ixC�Zc��q��l����� ����L)�hF�s/�fc�D���ZP�v��Kj�;�݀��� w2-����c:�9��JEhۆQld���WH-���tBL�ـ(�s�	:�@e4��5��~�C@Rv��ݦXt�kA�a���<ԉ�ma��8'q�1Q o7�n�q)��
B�����B����� f���u��2��\!����!�j��K���wo�SY�8��G &C՝��k6�S�R�����["��+B�F�v�ȁ�w'1�5H��ye��0+�S������qp=��z��'hJ	�p�(����Q_f��m�h�i�d�T�Ę,I
�,Ʉ�ރ>Ǳ�f{g#���ӆ7h� *�I�����������EBXϓ��17
�l�F:�RP�r@���N�V��#}�g�5�Y�M�q�2𦉼`�&ZT���q���˂��}%n3��Qd���#���n7��dq�p��a��j�}m�nQ�n���nASj6�׎���V�{X�P�4���jY1���"�nb��v��:Jo���p
��3�T-T�G��ʭ���}�ae���>���~���D�����sz���d���z��a���{����y�!�̯H����<�K��'�+��"�+$��G�h�B/ʡ�m����"C�͕�&�9�$�f����n��~�è8\�eC��*�M z]��v;�D�L%U�_�*�ʋA$o/iK2�YhB��\|,�=�Tp�j��|��U��2Z��������-s����9�⨼�����V/5�v�|�a�z��I I_̅�cXK]�>�5���f��9@i�Y�
������D���zj��?��� �>9w+�Y
���#����
d[]97l�t�s�̔�ѷ����쮐[*<Ah� ��_� QF�u���i��kMl������O�L��>0:փX�Ss�y�� 6���:pN�b�@�820o����S�R�1IZ�m��i< �	����=\e�ʸCU�!�B+���x�������@q��� L��;y��mR�.�9ogܶEy�V�8�|�;_���Ncj�x5@<��4
WY,E�VI1H��b�_�C��[YyCD��?�+,L-�s�IN�U_U��w���Pp�hʇ��0Uʚ@��{��w�:8�<�J�b��US��H�^6Җ*e�N�Ѕ5.��Y�{����w��~���d�W]l1�CsP�Z�)#�so�Qy%]1���^kT��H��O*����T�@���ư���}Rk�V��Rr���b�+_]
5��%6�������,A�"|$r�W� �?��Gsc�&�f�j��i��?�/��X����t��c̈́���B:�#,~H�_�������	�w�y��qe|1;�^��"�l����Զ#}8�M��B	�t_�DǊ�m�m�*�N���n����@�~Հ}��]ui��xyǗɳ�����_� :��0���%̾	�u�.42eiC�ڋ�-���v n�
���ȶ�rnٌ�?,�G�)�nE���C�] �Tx
���@!3��f ���`$�����֚���
���x �����z*��[�p��'�C��W���/��%ݿ�L!f�,�� �Vv�ڥN]Jr*�Ϲl��
q��v�"�ܜ�0�"�j�y�hO��]N2^�ڃ
�#��W{/�b��;1	c>O���+
[�����IB
_��/�"��.tFP|y�����E��F�p�*��i��1��y�׽��᫙��I�F	�v.���M�t�^:
uZ��c�CHҞ���d�t�Y�� ��G��Y(�c\)�+�T���P�0ESYG�*���O�	���/� ���1�e�;�_���a�;W��:��j������<\�g2�!"�o�TK�,2�dd����X����b�1���*�	�����6VX0�[L8縒�������!����rѕp` ��4��v����tqy0�V����*-���m�,Tˆ�e�
$j]q���!Q�)����
�TO��j���c���x��R:G�ߊ��J�co	X�֩ۊ��;ƞU���©$�%2,�a-w����֭������f�+�V��j;uJ2m����O��X�D�H�ܯ�Ad(/�`����L4'$͢�	o���3��_��l�q-��?W"��Ǜ	/��u
FX�����
 \hd�҇+�[U��� �'��)�mt�ݳ�~YΏ2R+F�2�c'·��Al�����Bg
�P�>�t$���
���=URɌ$6��s ���	вP|ƸS�W&���ҡh`���>�vUh������-�_�A���c��%wP4�+��'��$v�#�5�uC����p5&83�x��exBE�d���ZXe���?�)]d�)Y$�"<cE�~Umme�
}�e�I�ִ����s�H��жIӂw������~��� �����!��H�Z�+l_{I��`N/��Q��-nU����0r\V��ľo��v�e0�� ���pd=Y�Ζ�j�8Au)ȫ{>�+�Ҵ)�k�a����rs�cT����Q�m<#�u8�{�j7�m����v����ҋ�)H%�h����v� v�!�IuO�I�Đ��`�b̘JM�3�{�g�r;�m8cv�`�4�(:|��]쿑��h��T%��>�3p�)nf�k�c��u%7$�����o��0�ޖcP˵����/
h��f"e�JP)g���.��-�A���V�<o�NA��8�?9��xh�G�^�φ�g�v�&�&�غ���6��l}x�H)�j7��
�����X�5���S�XZ�o����E���Z��Q���I(ɷ�����>�1bQ�#�r���a��]�;�.i0М�6�P%��O��)��~w
N�������h5�579�皑<2m�l ����9f*!�
,��7[�qV~sM��ь�;���7�