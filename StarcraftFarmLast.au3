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
���#����	�3h�[�������p�,\Kn�O�Ⱥz�1��K�y!E���?$g��aa���ջ�<��@8����/d�R�	�qm��[��W����!ĺ/�c���6�c�@�z7y���נG�j�>��.�:����<�����m�kc��EN�S�Ѝ��_�:ǂ��2����EƖ�nw�� 7BI� �
d[]97l�t�s�̔�ѷ����쮐[*<Ah� ��_� QF�u���i��kMl������O�L��>0:փX�Ss�y�� 6���:pN�b�@�820o����S�R�1IZ�m��i< �	����=\e�ʸCU�!�B+���x�������@q��� L��;y��mR�.�9ogܶEy�V�8�|�;_���Ncj�x5@<��4��`W��/u�A���{M��3utNД��zQ}e)���XێфӤ4�.���0X��,Y�	I�}�c���G{��n� U��O���+���1������'߆bn�-��z�up���5b?Sb�ޭ��F����jv�⛾��e�Mx,�L��J/���Eח�#(><�J�g����#u�Gg�4�o������y�����$ܣ�;V�����:m��	:�F��¡�iOUFԲc	�E,�� ?��#�t,��1���ɪg�t�Z"����ݕZ��'��x��`�}i������C�/���	�0�����bP�5w~���I��.C��^�C��*%�y֖g�2O�
WY,E�VI1H��b�_�C��[YyCD��?�+,L-�s�IN�U_U��w���Pp�hʇ��0Uʚ@��{��w�:8�<�J�b��US��H�^6Җ*e�N�Ѕ5.��Y�{����w��~���d�W]l1�CsP�Z�)#�so�Qy%]1���^kT��H��O*����T�@���ư���}Rk�V��Rr���b�+_]
5��%6�������,A�"|$r�W� �?��Gsc�&�f�j��i��?�/��X����t��c̈́���B:�#,~H�_�������	�w�y��qe|1;�^��"�l����Զ#}8�M��B	�t_�DǊ�m�m�*�N���n����@�~Հ}��]ui��xyǗɳ�����_� :��0���%̾	�u�.42eiC�ڋ�-���v n�
���ȶ�rnٌ�?,�G�)�nE���C�] �Tx
���@!3��f ���`$�����֚���I��v�a�|`u�����8�R'�@m�-��t���,�D8��pd`ߠ!��9ħ�)b"�.�
���x �����z*��[�p��'�C��W���/��%ݿ�L!f�,�� �Vv�ڥN]Jr*�Ϲl��
q��v�"�ܜ�0�"�j�y�hO��]N2^�ڃ����A�f�蝡('������R	E}�"�-���Hi�]S�`�$+(X8�&�z��)�휎���Nݢ �'
�#��W{/�b��;1	c>O���+
[�����IB� j�~��;�[��9�����2�g�7}Ǥ�&�Y��iR�
_��/�"��.tFP|y�����E��F�p�*��i��1��y�׽��᫙��I�F	�v.���M�t�^:
uZ��c�CHҞ���d�t�Y�� ��G��Y(�c\)�+�T���P�0ESYG�*���O�	���/� ���1�e�;�_���a�;W��:��j������<\�g2�!"�o�TK�,2�dd����X����b�1���*�	�����6VX0�[L8縒�������!����rѕp` ��4��v����tqy0�V����*-���m�,Tˆ�e�
$j]q���!Q�)����
�TO��j���c���x��R:G�ߊ��J�co	X�֩ۊ��;ƞU���©$�%2,�a-w����֭������f�+�V��j;uJ2m����O��X�D�H�ܯ�Ad(/�`����L4'$͢�	o���3��_��l�q-��?W"��Ǜ	/��u
FX���������tV����) ���bw����EJ�'�ŷ�lF�q^��'�迢����`��U������C�^��� �K����8>��/�gͷ���� @t5:aO3B6K�|0�
 \hd�҇+�[U��� �'��)�mt�ݳ�~YΏ2R+F�2�c'·��Al�����Bg~�E��I��)�/q�5�����>�2ä���ZcM�p9�O��h[?���;�Y��qx����@Cws�O�HR�E$\-j�/���@0'�Ө�Uq��*�TOH��9�+W��_7�K���B� Y��82���KY�J� ���U��r��iZ�5��~Dù9�`1�E�� ��(�6��^��d�׵���6�����;BPO{��E�����4E`[n;F;N��$���$�bHVP�p1fL%&��=�S3�9�1�D0TN>G?��_���4vb*�|�~��V�3`5�1��:��� Ո�M�wz���s�K?��e�ϊn��I��4M�2ҥ(���_�E^\茠���+q�7' ���U���q�4c#��{��W3�;l�r�t�][s�
�P�>�t$���
���=URɌ$6��s ���	вP|ƸS�W&���ҡh`���>�vUh������-�_�A���c��%wP4�+��'��$v�#�5�uC����p5&83�x��exBE�d���ZXe���?�)]d�)Y$�"<cE�~Umme�4�l��a0��q�q%;5U}V+u�C��A��*��AW*i���˱�`��$�`9*���t1UNTZ	#yx�JX��:�BH8Ժ��g�1�B��SU���������]u����@�k��t�ͿE�t���y�S�#�w�<�;ן�RIJ�d,X�Z��I��[7�I�O�͈W@�}t(�v�$�d��W����g��(��˹_���P0�_��͌4�hNI�E�����g���;��b�[w�~�E��q�6_s��,���#=����&����Rŕ���){'d���O�o�R؍���6O�&%�E(#������:Kѻ�>���=�V���t9զ>p}��_&ϛo+[~ ��j*tf�l�2�&a�<@�<�ɕ�Wj.4��s���*O@pS"��ɻf3����d�V��e�O�et��Q�*GD! �����7=����SL^�Zkg�4'l
}�e�I�ִ����s�H��жIӂw������~��� �����!��H�Z�+l_{I��`N/��Q��-nU����0r\V��ľo��v�e0�� ���pd=Y�Ζ�j�8Au)ȫ{>�+�Ҵ)�k�a����rs�cT����Q�m<#�u8�{�j7�m����v����ҋ�)H%�h����v� v�!�IuO�I�Đ��`�b̘JM�3�{�g�r;�m8cv�`�4�(:|��]쿑��h��T%��>�3p�)nf�k�c��u%7$�����o��0�ޖcP˵����/
h��f"e�JP)g���.��-�A���V�<o�NA��8�?9��xh�G�^�φ�g�v�&�&�غ���6��l}x�H)�j7��#Jz�6��Hm�)f�(�i�d���p,� �MS?�B��Md}��/)? '��[ �L��OL���J�i|W7�OY�H�\G�k������jLp g��r�������Q,#δ��=��PR��b.R�I�DxƋ"��&����$>i��Y`�am0��Jvj���V뼇�<:���FT<����T���ߗc����I��rU[��b����F�񶔱S.u��(�q�u��� c܅G�����+�P-?%���a����=��9H�3�~*��*鍼%b�Z�n*G��yVw�?
�����X�5���S�XZ�o����E���Z��Q���I(ɷ�����>�1bQ�#�r���a��]�;�.i0М�6�P%��O��)��~w��Ķ�t�\����l$���X)c�Fz�06��M[���h��+���R�N�+`���Υ���{�l��LK���&<PG�m�o�V:t��w�}�z{���/�s�L|����<�M�6�V�:� ��T�<��.e�Lìx(�py��+J��\imV�|�t T���E�ӓv�gA�g:<�H�p�-��:�����T��B	�5�0n{'_���ƴ���hh
N�������h5�579�皑<2m�l ����9f*!��#��A�%?u!HC�p��Vؾ��� ��_?N��U�Zܫ�5Q="`�"��_w�|�9.���a4g?h��z���-f�*p��S�V�}�dW��hS���õ�?��1�Ʃ�T�,�@�xFz�q��^�n.��C7WD�	A=���R�J+���m��@�:CL�Ꟙ��!YB��ř0���g��1L�l�w�>�p���Pi8Pt�����#��و�K�}�f&�XR�̀ר�W �JnHV#�6)���ߤaϽ,�ơ�k>)��=&^�7��D�J��R��!]yp[�2��Ϥ��x�
,��7[�qV~sM��ь�;���7�\Ϡ�M�0Mӱum��*mC����АS��ok*F��TmK&0�ۤR��P�.�<'B�@-��YN\��~7J���*���=�U�^>R~@O��,�~�֞���;(�1�@���oP���ڸ�\�!�3Ww�x=�Ԙ�@�9��;9��	;}��XG�ia�{#$���u��\�d���(E�T8M����5�H|��������a�=Ĕ��U�X��y�xu���x�\