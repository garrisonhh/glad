project "glad"
	kind "SharedLib"
	language "C"
	cdialect "c99"

	warnings "Off"
	buildoptions "-fPIC"

	targetdir ("bin/%{prj.name}")
	objdir ("obj/%{prj.name}")

	files {
		"./include/**.h",
		"./src/**.c"
	}

	includedirs {
		"./include/"
	}

	if os.target() == "windows" then
		makesettings { "CC=gcc" }
	else
		links { "dl" }
	end

	filter "configurations:debug"
		symbols "On"

	filter "configurations:release"
		optimize "On"
