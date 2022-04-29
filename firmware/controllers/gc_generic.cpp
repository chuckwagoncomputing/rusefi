#include "pch.h"

#include "gc_generic.h"

#if EFI_TCU
GenericGearController genericGearController;

GenericGearController::GenericGearController() {
}

void GenericGearController::init() {
	for (int i = 0; i < 6; i++) {
		if (engineConfiguration->tcu_rangeInput[i] != GPIO_UNASSIGNED) {
			efiSetPadMode("Range Input", engineConfiguration->tcu_rangeInput[i], getInputMode(engineConfiguration->tcu_rangeInputMode[i]));
		}
	}

	GearControllerBase::init();
}

void GenericGearController::update() {
	

	GearControllerBase::update();
}

GenericGearController* getGenericGearController() {
	return &genericGearController;
}
#endif // EFI_TCU
