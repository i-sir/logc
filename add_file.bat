@echo off


::ɾ��֮ǰ�ļ�¼
del /q "D:\phpstudy_pro\WWW\log-c\git_log\*.*"



REM ��ȡ��ǰʱ���
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "dt=%%I"
set "YYYY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"
set "timeStamp=%YYYY%_%MM%_%DD%_%HH%_%Min%_%Sec%"

REM ָ��Ŀ¼
set "targetDirectory=D:\phpstudy_pro\WWW\log-c\git_log"  REM ��Ŀ��Ŀ¼·���滻Ϊ����Ҫ��·��

REM �������е�ǰʱ�����Ϊ�ļ������ı��ļ�����д�뵱ǰʱ�����Ϊ�ļ����ݵ�ָ��Ŀ¼
echo %timeStamp% > "%targetDirectory%\%timeStamp%.txt"


::���пհ׷�
@echo ^.
@echo ^..
@echo ^...
@echo ^....
@echo ^.....
@echo ^......
@echo ^.......
@echo ^........
::չʾ��Ŀ¼
@echo �ļ��Ѵ�����%targetDirectory%\%timeStamp%.txt����д��ʱ�����%timeStamp%
@echo ^........
@echo ^......
@echo ^.....
@echo ^....
@echo ^...
@echo ^..
@echo ^.