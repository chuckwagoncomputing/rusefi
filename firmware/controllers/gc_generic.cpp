#include "pch.h"

#include "gc_generic.h"

#if EFI_TCU
GenericGearController genericGearController;

GenericGearController::GenericGearController() {
}

void GenericGearController::init() {
	if (engineConfiguration->tcu_rangeInput[1] != GPIO_UNASSIGNED) {
		efiSetPadMode("Range Input 1", engineConfiguration->tcu_rangeInput[1], getInputMode(engineConfiguration->tcu_rangeInputMode[1]));
	}
	if (engineConfiguration->tcu_rangeInput[2] != GPIO_UNASSIGNED) {
		efiSetPadMode("Range Input 2", engineConfiguration->tcu_rangeInput[2], getInputMode(engineConfiguration->tcu_rangeInputMode[2]));
	}
	if (engineConfiguration->tcu_rangeInput[3] != GPIO_UNASSIGNED) {
		efiSetPadMode("Range Input 3", engineConfiguration->tcu_rangeInput[3], getInputMode(engineConfiguration->tcu_rangeInputMode[3]));
	}
	if (engineConfiguration->tcu_rangeInput[4] != GPIO_UNASSIGNED) {
		efiSetPadMode("Range Input 4", engineConfiguration->tcu_rangeInput[4], getInputMode(engineConfiguration->tcu_rangeInputMode[4]));
	}
	if (engineConfiguration->tcu_rangeInput[5] != GPIO_UNASSIGNED) {
		efiSetPadMode("Range Input 5", engineConfiguration->tcu_rangeInput[5], getInputMode(engineConfiguration->tcu_rangeInputMode[5]));
	}
	if (engineConfiguration->tcu_rangeInput[6] != GPIO_UNASSIGNED) {
		efiSetPadMode("Range Input 6", engineConfiguration->tcu_rangeInput[6], getInputMode(engineConfiguration->tcu_rangeInputMode[6]));
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
