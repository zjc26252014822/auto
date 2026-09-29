ARCHS = arm64 arm64e
TARGET = iphone:clang:16.5:16.0
THEOS_PACKAGE_SCHEME = rootless
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = AutoSleep
AutoSleep_FILES = Tweak.xm
AutoSleep_CFLAGS = -fobjc-arc -fblocks
AutoSleep_FRAMEWORKS = UIKit Foundation
include $(THEOS_MAKE_PATH)/tweak.mk
