// PAC.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <windows.h>
#include <iostream>

//int main()
//{
//    return 0;
//}


typedef int(*PatacFunc)(char *, char *, char *, char *);
int _tmain(int argc, _TCHAR* argv[])
{
	PatacFunc _PatacFunc;
	TCHAR const *path = _T("patacdll.dll");
	HINSTANCE hInstLibrary = LoadLibrary(path);
	char *a = "0101010104"; // 10个16进制字符
	//char *a = "1256452521"; // 10个16进制字符
	char *b = "04a78ea8913c64161ec743e1185cc83a5c7741e29bf54e92dedaf26923cf4adb11fd691265d11fada9ca4a2fbba635c7652ce0f922a09b040801364206c8";
		char *c = "04"; // 2个16进制字符
	char *d = new char[11]; // 定义输出缓冲区
	//d[10] = 0; // the end of the string.
	if (hInstLibrary)
	{
		_PatacFunc = (PatacFunc)GetProcAddress(hInstLibrary, "PatacSha");
		std::cout << "load ok." << std::endl;
		if (_PatacFunc)
		{
			std::cout << "test return:" << _PatacFunc(a, b, c, d) << std::endl;
			std::cout << "sha:" << d << std::endl;
			printf("%x", d);
		}
		FreeLibrary(hInstLibrary);
	}
	else
	{
		std::cout << "DLL Failed To Load!" << std::endl;
	}
	std::cin.get();
	return 0;
}

