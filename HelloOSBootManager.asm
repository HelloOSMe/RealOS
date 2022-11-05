	org 07c00h
	jmp short LABEL_START
	nop
	
	BS_OEMName		db 'totorial'
	BPB_BytsPerSec	dw 512
	BPB_SecPerPlus	db 1
	BPB_RsvSecCnt	dw 1
	BPB_NumFats		db 2
	BPB_RootEntCnt	dw 224
	BPB_TotSec16	dw 2880
	BPB_Media		db 0xF0
	BPB_FATSz16		dw 9
	BPB_SecPerTrk 	dw 18
	BPB_NumHeads	dw 2
	BPB_HiddSec		dd 0
	BPB_TotSec32	dd 0
	BS_DrvNum		db 0
	BS_Reservedl	db 0
	BS_BootSig		db 29h
	BS_VolID		dd 0
	BS_VolLab		db 'OS-tutorial'
	BS_FileSysType	db 'FAT12   '
	
LABEL_START:
	mov ax,cs
	mov ds,ax
	mov es,ax
	call DispStr
	jmp $
	
DispStr:
	mov ax,BootMessage
	mov bp,ax
	mov cx,16
	mov ax,01301h
	mov bx,000ch
	mov dl,0
	int 10h
	ret
BootMessage: db "Starting HelloOS"
times 510 - ($ - $$ ) db 0
db 0x55,0xaa