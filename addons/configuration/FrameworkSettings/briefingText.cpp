// Demo concept for simple briefing section. To-do: Add to own categories and section.

class GVAR(briefSituationText) { 
    collapsed = 0;
    displayName = "Situation";
    class Attributes {
        class GVAR(situationTabName) {
            displayName = "Tab Name";
            property = QGVAR(situationTabName);
            control = "Edit";
            expression = "_this setVariable ['%s',_value,true];";
			typeName = "STRING";
			defaultValue = "SITUATION";
        };

        class GVAR(situationTabText) {
            displayName = "Text";
            property = QGVAR(situationTabText);
            control: "EditMulti3";
            expression = "_this setVariable ['%s',_value,true];";
            typeName = "STRING";
            defaultValue = "''";
        };
    };
};