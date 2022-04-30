#include "pch.h"

#include "gc_generic.h"

#if EFI_TCU
GenericGearController genericGearController;

GenericGearController::GenericGearController() {
}

void GenericGearController::init() {
	for (int i = 0; i < efi::size(engineConfiguration->tcu_rangeInput); i++) {
		if (engineConfiguration->tcu_rangeInput[i] != GPIO_UNASSIGNED) {
			efiSetPadMode("Range Input", engineConfiguration->tcu_rangeInput[i], getInputMode(engineConfiguration->tcu_rangeInputMode[i]));
		}
	}

	GearControllerBase::init();
}

void GenericGearController::update() {
	SelectedGear gear = SelectedGear::Invalid;
	// 1-9 because 0 is SelectedGear::Invalid
	for (int i = 1; i <= 9; i++) {
		uint8_t *rangeStates;
		switch (i) {
		case 1 :
			rangeStates = config->tcu_rangePlus;
			break;
		case 2 :
			rangeStates = config->tcu_rangeMinus;
			break;
		case 3 :
			rangeStates = config->tcu_rangeP;
			break;
		case 4 :
			rangeStates = config->tcu_rangeR;
			break;
		case 5 :
			rangeStates = config->tcu_rangeN;
			break;
		case 6 :
			rangeStates = config->tcu_rangeD;
			break;
		case 7 :
			rangeStates = config->tcu_rangeM3;
			break;
		case 8 :
			rangeStates = config->tcu_rangeM2;
			break;
		case 9 :
			rangeStates = config->tcu_rangeM1;
			break;
		default:
			return;
		}
		for (int p = 0; p < efi::size(engineConfiguration->tcu_rangeInput); p++) {
			int cellState = rangeStates[p];
			if (!isBrainPinValid(engineConfiguration->tcu_rangeInput[p]) || cellState == 3) {
				gear = SelectedGear::Invalid;
				break;
			}
			bool pinState = efiReadPin(engineConfiguration->tcu_rangeInput[p]);
			if (cellState == 2 || (pinState && cellState == 1) || (!pinState && cellState == 0)) {
				gear = static_cast<SelectedGear>(i);
				continue;
			}
		}
		if (gear == SelectedGear::Invalid) {
			continue;
		} else {
			break;
		}
	}
	if (gear != SelectedGear::Invalid) {
		// TODO do something with the range we're in
		//  set gear_e to match gear for P,R,N,M3,M2,M1
		//  inc/dec gear_e for Minus, Plus
		//    kinda like button shift does, but only for gears 1-X, no PRN
		//  for D, need shift tables etc.
	}

	GearControllerBase::update();
}

GenericGearController* getGenericGearController() {
	return &genericGearController;
}
#endif // EFI_TCU
