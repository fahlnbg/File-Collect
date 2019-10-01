ARCHS = arm64
TARGET = iphone:clang:latest

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = UnderTime
UnderTime_FILES = udtRootListController.m
UnderTime_INSTALL_PATH = /Library/PreferenceBundles
UnderTime_FRAMEWORKS = UIKit
UnderTime_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/UnderTime.plist$(ECHO_END)
