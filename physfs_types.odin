package physfs

String_Callback :: proc(data: rawptr, str: cstring)
Enum_Files_Callback :: proc(data: rawptr, origdir: cstring, fname: cstring)
Enumerate_Callback :: proc(data: rawptr, origdir: cstring, fname: cstring) -> Enumerate_Callback_Result

Enumerate_Callback_Result :: enum {
    Error = -1,
    Stop = 0,
    Ok = 1,
}

File_Type :: enum {
    Regular,
    Directory,
    Symlink,
    Other,
}

Error_Code :: enum {
    Ok,
    Other_Error,
    Out_Of_Memory,
    Not_Initialized,
    Is_Initialized,
    Argv0_Is_Null,
    Unsupported,
    Past_Eof,
    Files_Still_Open,
    Invalid_Argument,
    Not_Mounted,
    Not_Found,
    Symlink_Forbidden,
    No_Write_Dir,
    Open_For_Reading,
    Open_For_Writing,
    Not_A_File,
    Read_Only,
    Corrupt,
    Symlink_Loop,
    Io,
    Permission,
    No_Space,
    Bad_Filename,
    Busy,
    Dir_Not_Empty,
    OS_Error,
    Duplicate,
    Bad_Password,
    App_Callback,
}

Io :: struct {
    version: u32,
    opaque: rawptr,
    read: proc "c" (io: ^Io, buf: rawptr, len: u64) -> i64,
    write: proc "c" (io: ^Io, buffer: rawptr, len: u64) -> i64,
    seek: proc "c" (io: ^Io, offset: u64) -> int,
    tell: proc "c" (io: ^Io) -> i64,
    length: proc "c" (io: ^Io) -> i64,
    duplicate: proc "c" (io: ^Io) -> ^Io,
    flush: proc "c" (io: ^Io) -> int,
    destroy: proc "c" (io: ^Io),
}

Archiver :: struct {
    version: u32,
    info: Archive_Info,
    open_archive: proc "c" (io: ^Io, name: cstring, for_write: int, claimed: ^int) -> rawptr,
    enumerate: proc "c" (opaque: rawptr, dirname: cstring, cb: Enumerate_Callback, origdir: cstring, callbackdata: rawptr) -> Enumerate_Callback_Result,
    open_read: proc "c" (opaque: rawptr, fnm: cstring) -> ^Io,
    open_write: proc "c" (opaque: rawptr, filename: cstring) -> ^Io,
    open_append: proc "c" (opaque: rawptr, filename: cstring) -> ^Io,
    remove: proc "c" (opaque: rawptr, filename: cstring) -> int,
    mkdir: proc "c" (opaque: rawptr, filename: cstring) -> int,
    stat: proc "c" (opaque: rawptr, filename: cstring, stat: ^Stat) -> int,
    close_archive: proc "c" (opaque: rawptr),
}

Stat :: struct {
    filesize: i64,
    modtime: i64,
    createtime: i64,
    accesstime: i64,
    filetype: File_Type,
    readonly: int,
}

File :: struct {
    opaque: rawptr,
}

Archive_Info :: struct {
    extension: cstring,
    description: cstring,
    author: cstring,
    url: cstring,
    support_sym_links: int,
}

Version :: struct {
    major: u8,
    minor: u8,
    patch: u8,
}