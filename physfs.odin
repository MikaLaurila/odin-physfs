package physfs

import "core:os"

// static lib
when os.OS == "windows" do foreign import lib {"lib/physfs-static.lib", "system:advapi32.lib", "system:user32.lib", "system:shell32.lib"}

@(default_calling_convention="c")
foreign lib {
    @(link_name="PHYSFS_getLinkedVersion") get_linked_version :: proc(ver: ^Version) ---
    @(link_name="PHYSFS_init") init :: proc(argv0: cstring) -> int ---
    @(link_name="PHYSFS_deinit") deinit :: proc() -> int ---
    @(link_name="PHYSFS_supportedArchiveTypes") supported_archive_types :: proc() -> [^]^Archive_Info ---
    @(link_name="PHYSFS_freeList") free_list :: proc(list_var: rawptr) ---
    @(link_name="PHYSFS_getDirSeparator") get_dir_separator :: proc() -> cstring ---
    @(link_name="PHYSFS_permitSymbolicLinks") permit_symbolic_links :: proc(allow: int) ---
    @(link_name="PHYSFS_getCdRomDirs") get_cd_rom_dirs :: proc() -> [^]cstring ---
    @(link_name="PHYSFS_getBaseDir") get_base_dir :: proc() -> cstring ---    
    @(link_name="PHYSFS_getWriteDir") get_write_dir :: proc() -> cstring ---    
    @(link_name="PHYSFS_setWriteDir") set_write_dir :: proc(new_dir: cstring) -> int ---        
    @(link_name="PHYSFS_getSearchPath") getSearchPath :: proc() -> [^]cstring ---    
    @(link_name="PHYSFS_setSaneConfig") set_sane_config :: proc(organization: cstring, app_name: cstring, archive_ext: cstring, includ_cd_rom: int, archives_first: int) -> int --- 
    @(link_name="PHYSFS_mkdir") mkdir :: proc(dir_name: cstring) -> int ---    
    @(link_name="PHYSFS_delete") delete :: proc(filename: cstring) -> int --- 
    @(link_name="PHYSFS_getRealDir") get_real_dir :: proc(filename: cstring) -> cstring --- 
    @(link_name="PHYSFS_enumerateFiles") enumerate_files :: proc(dir: cstring) -> [^]cstring ---
    @(link_name="PHYSFS_exists") exists :: proc(fname: cstring) -> int ---
    @(link_name="PHYSFS_openWrite") open_write :: proc(filename: cstring) -> ^File ---
    @(link_name="PHYSFS_openAppend") open_append :: proc(filename: cstring) -> ^File ---
    @(link_name="PHYSFS_openRead") open_read :: proc(filename: cstring) -> ^File ---
    @(link_name="PHYSFS_close") close :: proc(handle: ^File) -> int ---    
    @(link_name="PHYSFS_eof") eof :: proc(handle: ^File) -> int ---
    @(link_name="PHYSFS_tell") tell :: proc(handle: ^File) -> i64 ---
    @(link_name="PHYSFS_seek") seek :: proc(handle: ^File, pos: u64) -> int ---
    @(link_name="PHYSFS_fileLength") file_length :: proc(handle: ^File) -> i64 ---
    @(link_name="PHYSFS_setBuffer") set_buffer :: proc(handle: ^File, bufsize: u64) -> int ---
    @(link_name="PHYSFS_flush") flush :: proc(handle: ^File) -> int ---
    @(link_name="PHYSFS_swapSLE16") swap_sle16 :: proc(val: i16) -> i16 ---
    @(link_name="PHYSFS_swapULE16") swap_ule16 :: proc(val: u16) -> u16 ---
    @(link_name="PHYSFS_swapSLE32") swap_sle32 :: proc(val: i32) -> i32 ---
    @(link_name="PHYSFS_swapULE32") swap_ule32 :: proc(val: u32) -> u32 ---
    @(link_name="PHYSFS_swapSLE64") swap_sle64 :: proc(val: i64) -> i64 ---
    @(link_name="PHYSFS_swapULE64") swap_ule64 :: proc(val: u64) -> u64 ---
    @(link_name="PHYSFS_swapSBE16") swap_sbe16 :: proc(val: i16) -> i16 ---
    @(link_name="PHYSFS_swapUBE16") swap_ube16 :: proc(val: u16) -> u16 ---
    @(link_name="PHYSFS_swapSBE32") swap_sbe32 :: proc(val: i32) -> i32 ---
    @(link_name="PHYSFS_swapUBE32") swap_ube32 :: proc(val: u32) -> u32 ---
    @(link_name="PHYSFS_swapSBE64") swap_sbe64 :: proc(val: i64) -> i64 ---
    @(link_name="PHYSFS_swapUBE64") swap_ube64 :: proc(val: u64) -> u64 ---
    @(link_name="PHYSFS_readSLE16") read_sle16 :: proc(file: ^File, val: i16) -> int ---
    @(link_name="PHYSFS_readULE16") read_ule16 :: proc(file: ^File, val: u16) -> int ---
    @(link_name="PHYSFS_readSLE32") read_sle32 :: proc(file: ^File, val: i32) -> int ---
    @(link_name="PHYSFS_readULE32") read_ule32 :: proc(file: ^File, val: u32) -> int ---
    @(link_name="PHYSFS_readSLE64") read_sle64 :: proc(file: ^File, val: i64) -> int ---
    @(link_name="PHYSFS_readULE64") read_ule64 :: proc(file: ^File, val: u64) -> int ---
    @(link_name="PHYSFS_readSBE16") read_sbe16 :: proc(file: ^File, val: i16) -> int ---
    @(link_name="PHYSFS_readUBE16") read_ube16 :: proc(file: ^File, val: u16) -> int ---
    @(link_name="PHYSFS_readSBE32") read_sbe32 :: proc(file: ^File, val: i32) -> int ---
    @(link_name="PHYSFS_readUBE32") read_ube32 :: proc(file: ^File, val: u32) -> int ---
    @(link_name="PHYSFS_readSBE64") read_sbe64 :: proc(file: ^File, val: i64) -> int ---
    @(link_name="PHYSFS_readUBE64") read_ube64 :: proc(file: ^File, val: u64) -> int ---
    @(link_name="PHYSFS_writeSLE16") write_sle16 :: proc(file: ^File, val: i16) -> int ---
    @(link_name="PHYSFS_writeULE16") write_ule16 :: proc(file: ^File, val: u16) -> int ---
    @(link_name="PHYSFS_writeSLE32") write_sle32 :: proc(file: ^File, val: i32) -> int ---
    @(link_name="PHYSFS_writeULE32") write_ule32 :: proc(file: ^File, val: u32) -> int ---
    @(link_name="PHYSFS_writeSLE64") write_sle64 :: proc(file: ^File, val: i64) -> int ---
    @(link_name="PHYSFS_writeULE64") write_ule64 :: proc(file: ^File, val: u64) -> int ---
    @(link_name="PHYSFS_writeSBE16") write_sbe16 :: proc(file: ^File, val: i16) -> int ---
    @(link_name="PHYSFS_writeUBE16") write_ube16 :: proc(file: ^File, val: u16) -> int ---
    @(link_name="PHYSFS_writeSBE32") write_sbe32 :: proc(file: ^File, val: i32) -> int ---
    @(link_name="PHYSFS_writeUBE32") write_ube32 :: proc(file: ^File, val: u32) -> int ---
    @(link_name="PHYSFS_writeSBE64") write_sbe64 :: proc(file: ^File, val: i64) -> int ---
    @(link_name="PHYSFS_writeUBE64") write_ube64 :: proc(file: ^File, val: u64) -> int ---
    @(link_name="PHYSFS_isInit") is_init :: proc() -> int ---
    @(link_name="PHYSFS_symbolicLinksPermitted") symbolic_links_permitted :: proc() -> int ---
    @(link_name="PHYSFS_mount") mount :: proc(new_dir: cstring, mount_poin: cstring, append_to_path: int) -> int ---
    @(link_name="PHYSFS_getMountPoint") get_mount_point :: proc(dir: cstring) -> cstring ---
    @(link_name="PHYSFS_getCdRomDirsCallback") get_cd_rom_dirs_callback :: proc(c: String_Callback, d: rawptr) ---
    @(link_name="PHYSFS_getSearchPathCallback") get_search_path_callback :: proc(c: String_Callback, d: rawptr) ---    
    @(link_name="PHYSFS_utf8FromUcs4") utf8_from_ucs4 :: proc(src: [^]u32, dst: cstring, len: u64) ---    
    @(link_name="PHYSFS_utf8ToUcs4") utf8_to_ucs4 :: proc(src: cstring, dst: [^]u32, len: u64) ---   
    @(link_name="PHYSFS_utf8FromUcs2") utf8_from_ucs2 :: proc(src: [^]u16, dst: cstring, len: u64) --- 
    @(link_name="PHYSFS_utf8ToUcs2") utf8_to_ucs2 :: proc(src: cstring, dst: [^]u16, len: u64) --- 
    @(link_name="PHYSFS_utf8FromLatin1") utf8_from_latin1 :: proc(src: cstring, dst: cstring, len: u64) --- 
    @(link_name="PHYSFS_caseFold") case_fold :: proc(from: u32, to: [^]u32) -> int ---
    @(link_name="PHYSFS_utf8stricmp") utf8_stricmp :: proc(str1: string, str2: string) -> int ---
    @(link_name="PHYSFS_utf16stricmp") utf16_stricmp :: proc(str1: [^]u16, str2: [^]u16) -> int ---
    @(link_name="PHYSFS_ucs4stricmp") ucs5_stricmp :: proc(str1: [^]u32, str2: [^]u32) -> int ---    
    @(link_name="PHYSFS_enumerate") enumerate :: proc(dir: cstring, c: Enumerate_Callback, d: rawptr) -> int ---    
    @(link_name="PHYSFS_unmount") unmount :: proc(old_dir: cstring) -> int ---   
    @(link_name="PHYSFS_stat") stat :: proc(fname: cstring, stat: ^Stat) -> int --- 
    @(link_name="PHYSFS_utf8FromUtf16") utf8_from_utf16 :: proc(src: [^]u16, dst: cstring, len: u64) --- 
    @(link_name="PHYSFS_utf8ToUtf16") utf8_to_utf16 :: proc(src: cstring, dst: [^]u16, len: u64) --- 
    @(link_name="PHYSFS_readBytes") read_bytes :: proc(handle: ^File, buffer: rawptr, len: u64) -> i64 --- 
    @(link_name="PHYSFS_writeBytes") write_bytes :: proc(handle: ^File, buffer: rawptr, len: u64) -> i64 --- 
    @(link_name="PHYSFS_mountIo") mount_io :: proc(io: ^Io, new_dir: cstring, mount_point: cstring, append_to_path: int) -> int --- 
    @(link_name="PHYSFS_mountMemory") mount_memory :: proc(buf: rawptr, len: u64, del: proc(rawptr), new_dir: cstring, moun_point: cstring, append_to_path:int) -> int --- 
    @(link_name="PHYSFS_mountHandle") mount_handle :: proc(file: ^File, new_dir: cstring, mount_point: cstring, append_to_path: int) -> int --- 
    @(link_name="PHYSFS_getLastErrorCode") get_last_error_code :: proc() -> Error_Code --- 
    @(link_name="PHYSFS_getErrorByCode") get_error_by_code :: proc(code: Error_Code) -> cstring ---
    @(link_name="PHYSFS_setErrorByCode") set_error_by_code :: proc(code: Error_Code) ---
    @(link_name="PHYSFS_getPrefDir") get_pref_dir :: proc(org: cstring, app: cstring) -> cstring ---
    @(link_name="PHYSFS_registerArchiver") register_archiver :: proc(archiver: ^Archiver) -> int ---
    @(link_name="PHYSFS_deregisterArchiver") deregister_archiver :: proc(ext: cstring) -> int ---
}
