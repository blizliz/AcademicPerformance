*****************************************************************
* ����������� ���� � �������� ������� Real Estate               *
* �������� ��� ��������, ����������� ��� ������                 *
* ������������ ���������                                        *
* ��������� � RealEstate.prg �������� SET PROCEDURE TO FileProc *
*****************************************************************

PROCEDURE STOP            && ���������� ������ ���������
* ����������� �������� ��������������������� ������
* ��� ����� ������������ ������������ ���������  
  ON KEY LABEL ESCAPE     && ������� � �������� ������� ESC
  DEACTIVATE WINDOW ALL
  RELEASE WINDOW ALL
  SET RESOURCE ON         && ��������� ���������
                          && � ������� Foxuser.dbf
  _SCREEN.BACKCOLOR=RGB(255,255,255) && ������� ����������� ���
  _SCREEN.WINDOWSTATE=2              && ���������� �� ���� �����
  _SCREEN.MINBUTTON=.T.              && ���� ������ �����������
  _SCREEN.MAXBUTTON=.T.              && ���� ������ �������������
  _SCREEN.PICTURE=[]                 && ������ ��������   
  _SCREEN.ICON=[]                    && ������ ������
  * ������� ��������� ������
  _SCREEN.CAPTION=[Microsoft Visual FoxPro] 
  * ������� ���� ������� Visual FoxPro
* SET HELP TO
  ON SHUTDOWN             && ����. �������, �������������
                          && ����� ������ �� Visual FoxPro
  RELEASE ALL EXTENDED    && ������� �� ������ ����������
  SET EXCLUSIVE ON        && ����������� ������
  SET DELETED OFF         && ��������� ������ ������
  SET TALK ON             && �������� ���������� 
                          && ���������� ������ �� �����
  SET SAFETY ON           && ���������� ��������������� ���������
                          && ����� ����������� �����
  SET STATUS BAR ON       && ���������� ������ ������ ������  
  ON ERROR                && ������� ����������� ���������
                          && ��������� ������
  SET SYSMENU TO DEFAULT  && ������� ��������� ���� FoxPro
  CLOSE DATABASES ALL     && ������� ���� ������
  CLOSE TABLES ALL        && ������� ��������� �������
  CANCEL                  && ���������� ���������� FoxPro-���������
RETURN

PROCEDURE REALQUIT        && ������������� ������ �� FoxPro
LOCAL lnMsgResult
lnMsgResult=MESSAGEBOX('�� ������������� ������ ����� �� ���������?',;
                        20,' ����� �� ��������� ')
IF lnMsgResult=6      && ������ ��
    QUIT              && ���������� ������ ����� Visual FoxPro
ENDIF                             
RETURN

*PROCEDURE ERRORHND            && ��������� ��������� ������


PROCEDURE ADJUSTMENT          && �������� ���������� ����������
PUBLIC VersionFoxPro          && ������ FoxPro
VersionFoxPro=PADR(VERSION(),16)
PUBLIC DISK                   && �����, �� ������� ������� ��������
DISK=SYS(5)+SYS(2003)
* �������� ��� ��������� ������ � ��������
_DblClick=0.5       
PUBLIC LOGIN                 && ������� ���������
LOGIN = 0
PUBLIC SuperVisor             && ������� �������������
Supervisor = .F.


* ���������� ���������� ��� ������� � ������� ���� � ������� ����
PUBLIC Administration, Teacher, Student
STORE .F. TO Administration, Teacher, Student
RETURN

PUBLIC is_add
is_add = .F.


Function CrKod               && ���������� ������
PARAMETERS cPassword
PRIVAT cLetter,cEncryptedPassword
cPassword=RTRIM(cPassword)
cEncryptedPassword=[]
FOR I=1 TO LEN(cPassword)
    cLetter=SUBSTR(cPassword,i,1)
    cEncryptedPassword=cEncryptedPassword+CHR(ASC(cLetter)-I)   
NEXT I
RETURN cEncryptedPassword


Function UnKod               && ����������� ������
PARAMETERS cEncryptedPassword
PRIVAT cLetter,cPassword
cEncryptedPassword=RTRIM(cEncryptedPassword)
cPassword=[]
FOR I=1 TO LEN(cEncryptedPassword)
  cLetter=SUBSTR(cEncryptedPassword,i,1)
  cPassword=cPassword+CHR(ASC(cLetter)+I)     
NEXT I
RETURN cPassword
