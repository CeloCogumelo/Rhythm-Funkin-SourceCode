local ffi = require("ffi")  -- LuaJIT Extension
local user32 = ffi.load("user32")   -- LuaJIT User32 DLL Handler Function
local allowpopup = false

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_OKCANCEL = 0x00000001L,
    MB_ABORTRETRYIGNORE = 0x00000002L,
    MB_YESNOCANCEL = 0x00000003L,
    MB_YESNO = 0x00000004L,
    MB_RETRYCANCEL = 0x00000005L,
    MB_CANCELTRYCONTINUE = 0x00000006L,
    MB_ICONINFORMATION = 0x00000040L,
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
int MessageBoxW(HWND, LPCSTR, LPCSTR, UINT);
]])

function onDestroy()
    if allowpopup then
        user32.MessageBoxA(nil, "   Corgrats on beating the song,                                                  (an secret awaits you in the assets folder)", "IMPORTANT MESSAGE", ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)  
    end
end

function onEndSong()
    if getProperty('ratingPercent') >= 0.60 and not seenDaEnd then
        allowpopup = true
    end
end