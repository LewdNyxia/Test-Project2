extends Node
var Pname = ""
var pSTR = 0
var pAGI = 0
var pBOD = 0
var pPER = 0
var pINT = 0
var pSPE = 0

var pHP = 0
var pMHP = 0

var pMP = 0
var pMMP = 0

var pDAM = 0
var pSTA = 0
var pSPHC = 0
var pINI = 0

var fMP = 0
var fHP = 0
var fSTR = 0
var fAGI = 0
var fBOD = 0
var fPER = 0
var fINT = 0
var fSPE = 0

var pLB = 0
var pSB = 0
var pBW = 0
var pAXE = 0
var pPOL = 0
var pMA = 0
var pBOW = 0
var pXB = 0
var pTHR = 0

var mLB = 0
var mSB = 0
var mBW = 0
var mAXE = 0
var mPOL = 0
var mMA = 0
var mBOW = 0
var mXB = 0
var mTHR = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pMHP = 10 + (pSTR + fSTR * 2)
	pMMP = pINT + fINT * 1.5
	pLB = mLB + pAGI
	pSB = mSB + pAGI
	pBW = mBW + pAGI
	pAXE = mAXE + pAGI
	pPOL = mPOL + pAGI
	pMA = mMA + pAGI
	pBOW = mBOW + pAGI
	pXB = mXB + pAGI
	pTHR = mTHR + pAGI

func changeAttribute(attribute, amount):
	match attribute:
		"pSTR":
			pSTR += amount
		"pAGI":
			pAGI += amount
		"pBOD":
			pBOD += amount
		"pPER":
			pPER += amount
		"pINT":
			pINT += amount
		"pSPE":
			pSPE += amount
