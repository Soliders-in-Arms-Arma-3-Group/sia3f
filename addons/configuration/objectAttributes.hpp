class GVAR(objectSettings) {
	displayName = "SIA Framework";
	collapsed = 0;
	class Attributes {
		class GVAR(isArsenal) {
			displayName = "Is Arsenal";
			tooltip = "Check if this object is meant to be an arsenal";
			property = QGVAR(isArsenal);
			control = "Checkbox";
			expression = QUOTE( \
				if (_value) then { \
					if (isNil QQGVAR(arsenals)) then { GVAR(arsenals) = []; }; \
					GVAR(arsenals) pushBackUnique _this; \
				} else { \
					GVAR(arsenals) = GVAR(arsenals) - [_this]; \
				}; \
			);
			defaultValue = false;

			// condition should be objectSimulated && !objectControllable && !logicModule
			condition = "objectSimulated * (1 - objectControllable) * (1 - logicModule)"; // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Condition
		};

		class GVAR(isButton) {
			displayName = "Is Button";
			tooltip = "Check if this object is meant to be a button";
			property = QGVAR(isButton);
			control = "Checkbox";
			expression = QUOTE( \
				if (_value) then { \
					if (isNil QQGVAR(buttons)) then { GVAR(buttons) = []; }; \
					GVAR(buttons) pushBackUnique _this; \
				} else { \
					GVAR(buttons) = GVAR(buttons) - [_this]; \
				}; \
			);
			defaultValue = false;
			// condition should be objectSimulated && !objectControllable && !logicModule
			condition = "objectSimulated * (1 - objectControllable) * (1 - logicModule)"; // https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Condition
		};

		class GVAR(role) {
			displayName = "Role";
			tooltip = "The unit's role (e.g, ""Rifleman""); Only needs to be defined on playable units";
			property = QGVAR(role);
			control = "Edit"; // ToDo: custom control that hides when unit is not playable
			expression = QUOTE([ARR_2(_this, _value)] call FUNC(rolesExpression););
			typeName = "STRING";
			defaultValue = "''";

			// only units should have this attribute
			condition = "objectControllable";
		};

		class GVAR(supportInfo) {
			displayName = "Add to Support Info";
			tooltip = "Add object to the vehicle info tab";
			property = QGVAR(supportInfo);
			control = "Checkbox";
			expression = QUOTE(
				if (_value) then { \
					if (isNil QQGVAR(supportObjects)) then { GVAR(supportObjects) = []; }; \
					GVAR(supportObjects) pushBackUnique _this; \
				} else { \
					GVAR(supportObjects) = GVAR(supportObjects) - [_this]; \
				}; \
			);
			defaultValue = false;
			// condition should be objectSimulated && ((objectBrain && !objectControllable) || objectVehicle)
			condition = "objectSimulated * ((objectBrain * (1 - objectControllable)) max objectVehicle)";
		};
	};
};
