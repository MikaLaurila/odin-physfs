# odin-physfs
PhysicsFS wrapper for Odin Programming Language

Example
```
package main

import "core:fmt"
import pfs "shared:physfs"

main :: proc() {
  pfs.init(nil)
  
  pfs.mount("screenshots.7z, nil, 1)
  if pfs.exists("screenshot.png") != 0 {
    file := pfs.open_read("screenshot.png")    
    fmt.println(pfs.file_length(file))
    pfs.close(file)
  }
  
  pfs.unmount("screenshots.7z")
  pfs.deinit()
}
```
