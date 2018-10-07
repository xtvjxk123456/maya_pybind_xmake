-- add modes: debug and release
add_rules("mode.debug", "mode.release")

set_languages("cxx11")
set_optimize("fastest")

target("mayaCommand")
    set_kind("shared")
    add_files("src/mayaCommand.cpp")
    add_includedirs("C:/Users/Administrator/Desktop/maya2017u5/devkitBase/include",
                    "C:/Users/Administrator/Desktop/maya2017u5/devkitBase/include/python2.7",
                    "C:/Users/Administrator/Desktop/pybind11-demo/pybind11/include")
    add_linkdirs("C:/Program Files/Autodesk/Maya2017/lib")
    add_links("python27","OpenMaya")
    -- add_cxflags("$(shell python -m pybind11 --includes)")
    after_build(
        function(target)
            local targetfile = target:targetfile()
            os.mv(targetfile, path.join(path.directory(targetfile), format("%s.%s",path.basename(targetfile),"pyd")))
        end
    )
