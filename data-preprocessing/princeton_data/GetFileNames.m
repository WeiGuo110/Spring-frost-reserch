function [FileNames] = GetFileNames(Path,Format)
% GetFileNames
% �����Ĺ���Ϊ���ĳһ·���£�ĳ�ָ�ʽ�����ļ���
% ����������1ΪPath,Ҫ��ȡ��·����eg: 'D:\Program Files\FileZilla FTP Client\docs'
% ����������2ΪFormat��Ҫ��ȡ·�����ļ���ʽ��eg: '*.txt','*.docx','*.png'
 
fileFolder=fullfile(Path);
dirOutput=dir(fullfile(fileFolder,Format));
FileNames={dirOutput.name};
 
end