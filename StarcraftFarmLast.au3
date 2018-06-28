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

   ;;; Select w‘!óOæÊËi‡÷S³UWÕb·]ä?yáÔ.Z2¡ànr¦=.Þü»öŽ"O&’ªØ¯÷CTåE ’7—´¥Š™pÓ¬´!DƒK®>yä*8E5]ý¾A_ªiø™-U×[ÐÜÔï¹ÊGHáœÛñT^IWLmá+šÕ;qR>xÓÊ°Ã½yøU$$¯æBÅ€±¬%®úŸTšÀzÕ³Ôœ 4ú,Ø…t
××BGn¢IFM½5þéöy‹bˆŸ	»•øˆ,…åúìÜØÁsI†„ä™´Z-ÿÚ|qOÿKó¸m–.%·{§êä]=wóa%÷<Ž¢ÁHË’3×ù°°ø?àî‚jÝÿž{E Y_ ŒNò—²vH©[ÿ8¶þu-ˆßN+ßÓdý‚b]ôQ1â‚?Ûl|
±Ó t½¼ÃèkÐ#ßµ`ixCZcçÞqåòlù¶òµ±×à ˆ†¢§L)æhFÉs/‚fcÁDƒÍ™ZPåv¢ãKj·;àÝ€¡¤ô w2-®œ›¶c:Ë9ÑæJEhÛ†QldùÐöWH-• ´tBLá¯Ù€(£sØ	:ø@e4Åî5¦¶~ûC@RvÀ§Ý¦XtŸkA¬a©¹Î<Ô‰ámaô8'qË1Q o7ènâq)û©
Bˆ¤‹…­B¶Å÷´ž fâùúuŠ®2Öå\!ª‰éó!Åjû¼KæùÉwoöSY 8ÁûG &CÕ¼ék6©S„RœŠ·³î["¼í+BœF¾v¯Èøw'1Œ5H¼ yeÓÂ0+×SŒ—ºö Ãqp=¦Ðzºº'hJ	ïp½(¾²”‚Q_fˆ¬mÇhÂiÒd—TüÄ˜,I
Ê,É„¤Þƒ>Ç±Šf{g#½ñöÓ†7h† *ƒIÂƒ§Èçü•ÞËù¿æŽÌEBXÏ“ïÃ17
Â–æl½F:¸RPƒr@±©±NïVþý#}égö5»YñMßqé2ð¦‰¼`‚&ZT¥—öqø¢ëË‚Ý”}%n3ÆøQdäºÜ#Š³óšn7†ŒdqÞpõïa¼øjæ}m’nQ‚n‹«nASj6Ç×Ž„‚V£{XáPÒ4§ª£jY1„†Ý"–nb€áv‘á:Jo˜×Êp
äÕ3ñºT-TÖGÑîÊ­ñò“ò}¼ae°ôÈ>´ôÌ~ÀÁÙD¡Žê—Åsz„õ˜dŽÕÄzæ±¨aš»¿{Áî¤ÇyÏ!ÙÌ¯H¡Ûì•Â<ëK³Ù'õ+¬–"å+$˜¤GŒh±B/Ê¡Âm­¬¼¡"CæŸÍ•–&Ó9î$§fª¯ªÅn»È~óÃ¨8\´eCÀÜ*åM z]½ùv;ìDžL%U±_î†*©Ê‹A$o/iK2á§YhB‰—\|,ò=ÈTpŠj»û|‚¿UÓñ2Z«®¶ÿ¡¹¨Þ-s”Ž‘Ã9·â¨¼’®˜ÛÂV/5ªvâ¤|ñ§•a‡zóðªI I_Ì…‹cXK]õ>©5€õ«fÿ©9@iôY±
è¯®…ŽÝD’Œ›zjÿü?Óìó Å>9w+ñY
ËõØ#¹±‚æ“	É3hµ[ÿ´øâŸþ—çpÛ,\Kn÷OÕÈºzî1æÂKîy!E‚‘–?$g¯óaaðÁÝÕ»ÿ<öŠ@8²¾å/dì‘R¶	þqmüê[¾œW¿¦Éû!Äº/è¢cÅ¶Ø6øc§@éz7y‡Ðþ× G¿jÀ>Òð.‡:´ÇÎ¼<ãËäÙómåkc¯ÀEN˜SÌÐ’æ_Ì:Ç‚ˆš2´¡ÊíEÆ–ÕnwÁ» 7BIè î
d[]97lÆt–s£Ì”ŠÑ·¢ØÉó¡ì®[*<Ahè„ ™Ã_³ QFç°uð€Êi‹ÜkMlýö†€¤íO»L°é>0:ÖƒXÃSsœy©Ã 6ÚÂé:pNã–b¢@Þ820oÐÝÄâS÷R„1IZ…m‹ïi< Ì	Åóôê=\e­Ê¸CUÒ!æB+ŠÕ÷x—Íó’îßì¦³@qƒöŽ L‡«;yÒÖmR§.¥9ogÜ¶EyÚV…8|ì;_‘ðîNcj‘x5@<òÊ4§„`W®§/uíA†âà{M ô3utNÐ”ÞázQ}e)¢¾ÍXÛŽÑ„Ó¤4É.©ù‰0X’”,Y“	I½}cÌöÎG{ãí§nÑ U“…O‘Ïù+½—ò1Í˜Š„±Ÿ'ß†bn…-ÌØzŒup¤¡ä€5b?SbÞ­ýúFûÒÏìjv³â›¾ãÒeáMx,ÁL´©J/ìâðE×—º#(><úJÜgð¢ÉÈ#u¸Ggç4ÜoÈã¼áëÞÃyðÕÌúÛ$Ü£Ý;VÜþ‚¦Ô:m¯	:­Fö±Â¡¤iOUFÔ²c	ºE,ÜÅ ?Âí#Ât,”ß1®”àÉªgãt¨Z"©¬£Ý•Zãå'äûxÂË`é}ié˜ýƒ²‰CÔ/Šæõ	ë0É«ˆõÍbPÃ5w~÷ƒÜIŽóž.C³™^‘C·Ù*%„yÖ–g²2Oê
WY,EÊVI1HÑb„_•C„Û[YyCD‡Í?›+,L-¦sÜINÍU_UŠÝwýç‡Pp¹hÊ‡¸0UÊš@ô»{òìwØ:8‰<˜J«b¿ÝUS•‚HÞ^6Ò–*eÃN²Ð…5.¸øYä{¨áÕwöù~ª§âdµW]l1ÿCsP¼Zç)#†soÅQy%]1·„¬^kTíÅHøãO*ÃõçáT’@’¿™Æ°–»ê}RkëVÍÿRr€Óè³bÐ+_]
5º‰%6ôÕÿø§Ùæ,AŠ"|$rîWâ ²?—ë°GscÍ&’fÑj·ÿiðÅ?ý/Îá¶X¸–ÝîŸ«‘tõÜcÍ„—ÜòB:‹#,~HÏ_æÂÃàÿƒº	«wþyí€qe|1;Ê^ÉÙ"¥lüâÛùÔ¶#}8¯M“öB	‰t_ÑDÇŠÿm°mð*ÇNÒônó¡ý¯@~Õ€}¥à]uiœxyÇ—É³æÛÊÖÇ_€ :Š0§™¡%Ì¾	˜u.42eiC•Ú‹-ªÜïƒv n„
“ÐÜÈ¶ºrnÙŒè?,çG™)£nE±“çCÙ] ¶Tx
‚ÑÑ@!3†¿f ¢Ï`$ëá”Ó¸ÖšÙûíIÛŸv™aÒ|`u­±†¦ç8óR'†@m´-„ÒtàÇ,ÅD8¼pd`ß !»ˆ9Ä§î¤)b"’.µ
ÛÞÒx ˜‹çéÔz*¸Ë[•p†ª'¤CÌ„W«îñ/›ç%Ý¿ÙL!f€,ãí ™Vvó¥¬Ú¥N]Jr*ÞÏ¹lŠó´­
qùØv¿"áÜœÆ0Õ"ðj€yå”hOÀ¯]N2^ëÚƒÅÀö›Aèfêè¡('½Âô¢úÊR	E}š"°-·£§Hi’]Só`±$+(X8³&“zûÆ)™íœŽ÷ÇÛNÝ¢ ª'
Ÿ#ŸòW{/äbÿš;1	c>O¿ÄÜ+
[™°õêàIBÉ jÄ~¦Å;½[ûôŒ9÷¥ŸØÔ2ígÅ7}Ç¤ËÂš&ðY‚™iR”
_ÙÄ/à"‹¯.tFP|yô•¸ÏáE“FëpŽ*ÏÎi¸Þ1‘ÇyÃ×½†óá«™ô¶I¹F	ºv.­¹ýM¨tÛ^:
uZíc…CHÒžª©dÆtŠY¹Š …ÚG„èY(¾c\)À+“TÏÆéP´0ESYG»*´ÇÊOÈ	öñ…–À/Ó úÓÓ1ûe†;¨_ÍêÖa’;WëšÄ:¡†jîýï¸“ç<\‡g2¼!"‡o²TKó­,2ÏddŸÔ®²X‹”¬’b‘1¢Å¿*‡	¶¶²ò†‰š6VX0˜[L8ç¸’šª¾«ºï!ûÏ árÑ•p` «•4év÷åØï°tqy0•VÅºª§*-‘¼¼m¥,TË†e¡
$j]qð³È÷!QÂ)ªïíò
ýTOÄÉj®ºØcþ†æ xµÎR:GæßŠ¢òJºco	X¼Ö©ÛŠ‘ð;ÆžU†ëÏÂ©$%2,a-wÔú¤ÖÖ­›þ¤å§ÑfÄ+ V¾ºj;uJ2mé«ÿðÿO³ÌXƒDøHåÜ¯ÄAd(/×`ŽæÆšL4'$Í¢Ô	oþÓà3Šú_Ãl±q-»Ý?W"éë¸Ç›	/¹ä„u
FXü‘ž¿Ì…‡ÁÿtVïüóÚ) âÊøbw”½“²EJØ'ùÅ·ó©lFúq^þ›'ì„è¿¢‰þÛ`ÛàUŽ¥èÝæCû^ý« ûKÀºêÓ8>ðó/“gÍ·•­Ž¿ @t5:aO3B6K™|0ë
 \hdÊÒ‡+µ[U¹ßì Ý' ¸)‘mtäÝ³Ð~YÎ2R+FÜ2‹c'Î‡²ºAl¨ð£¢€Bg~ÌEžÀI×Â)¦/q­5³÷Ú“¶>í2Ã¤øÀëZcMÎp9æ¤O€Ûh[?¤éÁ;ŽYŠˆqxàÈÁ¿@Cws‰OÝHRÄE$\-j¶/½¤ð@0'ÏÓ¨ôUq–·*áTOH‡˜9®+WÝâ_7ÎK»²˜BÍ YÆÚ82¬íçKYµJœ º”äU½ŸrÙçiZâ5ó°í~DÃ¹9Œ`1ªEàÕ óË(Ð6ž^ºœd½×µ‹í6ƒÐÍÕÑ;BPO{…éEõ”¤Šû4E`[n;F;NÓ$º§æ$ÁbHVP°p1fL%&ôö=ŒS3Û9ï¶œ1»D0TN>G?ä®ö_ÈÅÿ4vb*Æ|Ÿ~‰¸V·3`5ê1ÕÀ:’„’ ÕˆýMŠwz·÷ésïK?±¨eÚÏŠnûI—…4Mà³2Ò¥(¿³ˆ_ÀE^\èŒ øóé+qž7Â‹' ÖáUŸœÓq¼4c#Žó‡¯{çÃW3è;l“rŒtì][sú
›Pé¶>¼t$êµÚÇ
†‘¥=URÉŒ$6é³s ÿ´	Ð²P|Æ¸S€W&©ŸÒ¡h`Š¦²>vUh”Ÿíã-€_¦Aõ§¦cöÊ%wP4¾+›Ô'¬Ã$v®#×5ˆuCÕÝûÞp5&83Îx¹ÎexBEßd¨–çZXežÈÉ?¨)]d±)Y$Å"<cEŠ~Ummeå4þl¬°a0¶˜qÏq%;5U}V+uÞC÷žAÂå£*àÀAW*iÒíïË±ß`èâ$ò`9*­Šÿt1UNTZ	#yxÛJX©—:ËBH8Ôºãág1îB£„SUßÛäú¨Ÿ‰’Õ]u°ÇýÍ@ñkœ¤tŽÍ¿Eä•tÆÞ±y­S·#àw<«;×Ÿ…RIJþd,XÂZï©õI¬­[7ýIÊO¢ÍˆW@­}t(Ôvê$”dÛÓWÿáþŸg˜±(‰ð‘Ë¹_ˆ‚ÈP0þ_®ÁÍŒ4˜hNI›E¨ßý§Àgÿô¿;†Ùbâ[wº~®EÓ×q6_sÉê,Œ±ù#=˜ƒþè&­ßùç´RÅ•ðÄï){'dŠ•°Oó‹oçRØôâ½ý6OÙ&%ÑE(#ý¶Á·À«:KÑ»Ì>‡ö½=ûVö—t9Õ¦>p}áç_&Ï›o+[~ €èj*tÂžf„l—2ø&aÖ<@¸<ÐÉ•¥Wj.4¶«s¾Øº*O@pS"ÚéÉ»f3 ü³d¤V¸eÆOet‚ÙQà*GD! „Îý˜Š7=€“¯„SL^ãZkgï´4'l
}Úe‡IñÖ´Æ›œàsÍHž¶Ð¶IÓ‚w³âñÁ‘ƒ~€†î çŸº¤!ˆŠH¸ZÔ+l_{Ià€`N/Ÿ§Qèªã-nUÂ¨ž‘0r\V¯»Ä¾oœ—vÿe0…š ³Œ´pd=YÛÎ–³j•8Au)È«{>å²+ÎÒ´)ÄkçaÚüˆ‡rsÀcT‹Áªç–Q m<#½u8É{¯j7Úm¡›«¢v„ ž÷Ò‹ë)H%öhŠÀ¶ÜvŒ v!¦IuOÌI‚Ä¬¡`àbÌ˜JMè3ì{¦g¶r;ßm8cvˆ`¨4œ(:|ŽÉ]ì¿‘‹þhìÄT%Œù>ü3p¬)nfÀkÔc«€u%7$«ú›îõoïÒ0çÞ–cPËµŸÝ÷“/
h›Áf"e¥JP)g¿€Š.¼¸-ÑAñçÒVã<o…NA­Â8«?9¦ãxhÆGç^öÏ†®gÐvÙ&å&éØº¶çô6¡Ól}xèH)Õj7µŽ#Jzª6¥“HmÒ)fæ(þi¡d ùp,§ ®MS?¥BÐÁMd}ìªÐ/)? 'ÛÆ[ ¿LƒëOLÇì”Jî i|W7¨OY†Hí\G®kê†«»÷¼àjLp gœñrœÊð„Š¾ÉQ,#Î´°Ë=‘’PRºÉb.R²IŠDxÆ‹"üª&ÚÚËÊ$>iüÙY`Âam0ãžâJvjªú¬Vë¼‡ï<:ƒ…ËFT<Á€‚®TÒ¥Ûß—c¾ÁÑÄIäÀrU[þèbªœ¨´Fòñ¶”±S.u–„(q©uÇÂÏ cÜ…G¦«¿·È+õP-?%ªºëaúš€=â×9Hé3›~*‹É*é¼%bóZ§n*GÀïyVw¯?
¤’•üÈX°5„µßSê“XZ¶oú“”ŸE›®ZúèQ¨íÔI(É·¦¯ÿÃý>Ï1bQá#—r¿ aü¿]‚;›.i0Ðœ“6‹P%¿ûO€Î)ÿé~w²ÅÄ¶ïtý\‹§®ãl$¾ç’ÔX)còFzÿ06üÐM[¿óÏh¤‹+à‰ÞRöNÉ+`ŸçßÎ¥±éÅ{úlŸ²LK¢þŠ&<PGûmƒoV:t—£w˜}íz{ö¬í/ès«L|àûÃÎ<¾MŸ6ÞV¶:ü ÐÔTé…<ÍÙ.eðLÃ¬x(py¡“+J®Ô\imVç|°t Tž€à¦EµÓ“vÌgAùg:<ÉH­pÊ-ŒŸ:Êé²£ÀTŽˆB	œ5û0n{'_¦˜½Æ´ÖÏßhh
NØû´Ë“ã­h5Œ579Àçš‘<2m¡l þ“§î9f*!Äãƒ#ýÜAÎ%?u!HC‘pµ¨VØ¾ö“Á Àœ_?N£ÑUÆZÜ«„5Q="`ä"¸­_w‰|ß9.íþÊa4g?hàÈz³·-fÕ*p‚êS‘Vö}ËdW¥hSˆ×ÎÃµù?äæ1€Æ©ƒTÏ,£@ÚxFzêq’÷^Ôn.´ÚC7WDí	A=î¥ÖRJ+ìÑm¸í@í:CL’êŸ˜“‰!YBÁÀÅ™0”›ÐgØö1LÏläw¾>ÚpÆíÀPi8Ptùÿ’»Ù#üÑÙˆ¨Kò}øf&áXRÜÍ€×¨ÇW êJnHV#õ6)Ýêßß¤aÏ½,þÆ¡—k>)»î=&^Ñ7‚ÌDËJ” RþÎ!]yp[¢2ƒãÏ¤­Æxß
,œ‚7[„qV~sMÆðÑŒŽ;Î½ì7Ÿ\Ï í²MÊ0MÓ±umÏè*mC¦ØúñÐSªÔok*F”õTmK&0Û¤RÍÌPü.Ò<'BÉ@-óàYN\š¦~7J…¡‚*šÈú=ÙU ^>R~@O·Œ,¶~™Öž™Ø;(”1Ý@Òø®oPž³‘Ú¸\Ö!Õ3Wwïx=ÀÔ˜à@Ï9âä;9•á	;}’¢XGia–{#$þ ¥u’Ä\¥d“ˆñ(EùT8Mµµ—”5äH|Óù²²Á„ÂÚaÇ=Ä”ìÕUõX­×yÞxu–Œ¨xƒ\