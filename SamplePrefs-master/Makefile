include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SamplePrefs
SamplePrefs_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += samplepref
include $(THEOS_MAKE_PATH)/aggregate.mk
