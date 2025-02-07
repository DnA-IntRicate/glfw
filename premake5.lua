-- OUT_DIR and INT_DIR must be defined in the top-most premake file before including this file

project "glfw"
    kind "StaticLib"
    language "C"
    warnings "Off"

    debugdir (OUT_DIR)
    targetdir (OUT_DIR)
    objdir (INT_DIR)

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",

        "src/internal.h",
        "src/platform.h",
        "src/mappings.h",
        "src/init.c",
        "src/input.c",
        "src/context.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
        "src/platform.c",

        "src/null_platform.h",
        "src/null_joystick.h",
        "src/null_init.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c"
    }

    filter "system:windows"
        systemversion "latest"
        files
        {
            "src/win32_init.c",
            "src/win32_joystick.h",
            "src/win32_joystick.c",
            "src/win32_module.c",
            "src/win32_monitor.c",
            "src/win32_platform.h",
            "src/win32_thread.h",
            "src/win32_thread.c",
            "src/win32_time.h",
            "src/win32_time.c",
            "src/win32_window.c",

            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "system:linux"
        systemversion "latest"
        files
        {
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_platform.h",
            "src/x11_window.c",
            "src/xkb_unicode.h",
            "src/xkb_unicode.c",
            "src/linux_joystick.h",
            "src/linux_joystick.c",
            "src/posix_module.c",
            "src/posix_thread.h",
            "src/posix_thread.c",
            "src/posix_time.h",
            "src/posix_time.c",

            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_X11"
        }

    filter "system:macosx"
        systemversion "latest"
        files
        {
            "src/cocoa_init.m",
            "src/cocoa_joystick.h",
            "src/cocoa_joystick.m",
            "src/cocoa_module.m",
            "src/cocoa_monitor.m",
            "src/cocoa_platform.h",
            "src/cocoa_thread.h",
            "src/cocoa_thread.m",
            "src/cocoa_time.h",
            "src/cocoa_time.m",
            "src/cocoa_window.m",
        }

        defines
        {
            "_GLFW_COCOA"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "Full"

    filter "configurations:Release"
        runtime "Release"
        symbols "Off"
        optimize "Full"
